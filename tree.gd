extends Node2D
@export var age = 0
@onready var spr = get_node("tree_sprite")
var txts = [
	preload("res://assets/trees/tree1-age0.png"),
	preload("res://assets/trees/tree1-age1.png"),
	preload("res://assets/trees/tree1-age2.png"),
	preload("res://assets/trees/tree1-age3.png"),
	preload("res://assets/trees/tree1-age4.png")
]
@onready var world = get_parent()
@onready var start_time = world.seconds

@onready var view = get_node("Area2D/view")

# Called when the node enters the scene tree for the first time.
func _ready():
	choose_sprite()
	
	#=====Stats====
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if world.seconds -start_time >=10:
		age+=1
		start_time = world.seconds
		choose_sprite()


	

func choose_sprite():
	if age <5:
		spr.set_texture(txts[age])


		
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("IAMTREEEE", body_rid, body, body_shape_index, local_shape_index)



	


func _on_tree_entered(body):
	print(body)
	pass # Replace with function body.
