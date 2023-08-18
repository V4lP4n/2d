extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_body_entered(body, body_rid):
	
	pass



func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):	
	#print(body_rid, body, body_shape_index, local_shape_index)
	scan_area()
	
	
func scan_area():
	var all = get_overlapping_bodies()
	var grnd 
	var other = []
	for i in all :
		if i.name == "grnd":
			grnd=i
		else:
			other.append(i)
			
	print(all, "\n", grnd)
		

