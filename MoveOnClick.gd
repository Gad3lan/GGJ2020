extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos = Vector2()
export (Vector2) var dest = Vector2(700, 300)
export (float) var tolerance = 50
var isMoved
var clicking
var needLongClick
var isDragAndDrop = true
var startTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	isMoved = false
	needLongClick = true
	clicking = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isDragAndDrop and clicking:
		pos = get_viewport().get_mouse_position()
		set_position(pos)
	if !isDragAndDrop and clicking and OS.get_ticks_msec() - startTime >= 500:
		isMoved = !isMoved
		clicking = false
	var pos = Vector2()
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and !needLongClick:
			clicking = true
		else:
			if pos.x >= dest.x - tolerance and pos.x <= dest.x + tolerance and pos.y >= dest.y - tolerance and pos.y <= dest.y + tolerance:
				print("Adjusted")
				pos = dest
				set_position(pos)
			clicking = false
		if event.is_pressed() and needLongClick:
			startTime = OS.get_ticks_msec()
			clicking = true
		else:
			startTime = OS.get_ticks_msec()
			clicking = false
	
	pass # Replace with function body.
