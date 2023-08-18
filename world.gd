extends Node2D
@export var sec_elapsed = 0
@export var seconds = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_on_Time_Elapsed_timeout()
	pass
	
func _on_Time_Elapsed_timeout():
	sec_elapsed += 1
	seconds = sec_elapsed  / 60
	var str_elapsed = "%02d" % [seconds]
	var l = get_node("Label")
	l.set_text(str_elapsed)
