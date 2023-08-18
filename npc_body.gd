extends CharacterBody2D

var txts = [
	preload("res://assets/npc/npc-f.png"),
	preload("res://assets/npc/npc-b.png"),
	preload("res://assets/npc/npc-l.png"),
	preload("res://assets/npc/npc-r.png"),

]
const SPEED = 150.0
var radius = 300.0

@onready var map : TileMap = $%grnd
@onready var agent : NavigationAgent2D = $NavigationAgent2D
var target = Vector2()
var vel = Vector2()
@onready var spr = get_node("Sprite2D")


func _ready():
	agent.velocity_computed.connect(on_velocity_computed)
	agent.path_changed.connect(on_path_changed)
	agent.target_reached.connect(on_target_reached)
	agent.set_navigation_map(map)
	
	choose_coord()
	agent.target_position = target

func _physics_process(delta):
	
	if agent.distance_to_target()>2:		

		var next_location = agent.get_next_path_position()

		var v = (next_location - self.global_position).normalized()
		agent.set_velocity(v)
		
		if velocity.x >= 0:
			spr.set_texture(txts[0])
		else:
			spr.set_texture(txts[1])
			



func choose_coord():
	var x = get_parent().position.x + randf_range(radius, -radius)
	var y = position.y + randf_range(radius, -radius)

	target = Vector2(x,y)

	
func on_velocity_computed(safe_velocity: Vector2) -> void:
	self.position += safe_velocity


func on_path_changed() -> void:
	#print(agent.get_current_navigation_path())
	pass


func on_target_reached() -> void:

	get_tree().quit()


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	pass # Replace with function body.
