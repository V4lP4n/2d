extends Area2D
@export var other = []
@export var grnd :TileMap
@export var tile_rid: RID
@export var tile: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass



	
func scan():
	var all = get_overlapping_bodies()
	#var grnd 
	#var other = []
	for i in all :
		if i.name == "grnd":
			grnd=i
		else:
			other.append(i)
			
	#print(all, "\n", grnd)
		

