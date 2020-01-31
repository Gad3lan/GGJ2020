extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Vector2) var origin = Vector2(500, 300)
export (Vector2) var dest = Vector2(700, 300)
var isMoved
var clicking
var needLongClick
var startTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	isMoved = false
	needLongClick = true
	clicking = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clicking and OS.get_ticks_msec() - startTime >= 500:
		isMoved = !isMoved
		clicking = false
	var pos = Vector2()
	if isMoved:
		pos = dest
	else:
		pos = origin
	set_position(pos)
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and !needLongClick:
			isMoved = !isMoved
		if event.is_pressed() and needLongClick:
			startTime = OS.get_ticks_msec()
			clicking = true
		else:
			startTime = OS.get_ticks_msec()
			clicking = false
	
	pass # Replace with function body.
