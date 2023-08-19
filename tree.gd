extends Node2D
var grow_speed = 1 # secs to grow
@export var age = 0
@onready var spr = get_node("tree_sprite")

var cells = []
var txts = [
	preload("res://assets/trees/tree1-age0.png"),
	preload("res://assets/trees/tree1-age1.png"),
	preload("res://assets/trees/tree1-age2.png"),
	preload("res://assets/trees/tree1-age3.png"),
	preload("res://assets/trees/tree1-age4.png")
]
@onready var world = get_parent()
@onready var start_time = world.seconds

@onready var scanner = get_node("scaner") 
#@onready var sc = self.



func _ready():
	choose_sprite()
	

	pass
	

func _process(delta):
	if world.seconds -start_time >= grow_speed:
		age+=1
		start_time = world.seconds
		choose_sprite()
		if age >= 4:
			multiply()


	

func choose_sprite():
	if age <5:
		spr.set_texture(txts[age])


func multiply():
	scanner.scan()
	var cur_cell=scanner.grnd.map_to_local(position)
	
	scanner.grnd.set_cell(0,cur_cell,0,Vector2(1,0))
	
	var next_cell = Vector2(randi_range(-3,3), randi_range(-3,3))
	var cell = scanner.grnd.get_cell_tile_data(0, next_cell)
	
	if cell!= null and cell.get_custom_data("plantable"):
		var scene = load("res://tree.tscn")
		var inst = scene.instantiate()
		#var inst = self.duplicate()
		inst.position = scanner.grnd.map_to_local(next_cell)	

		scanner.grnd.set_cell(0,next_cell,0,Vector2(1,0))				
		world.add_child(inst)
	
		return

	
