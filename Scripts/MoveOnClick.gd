extends Area2D

var pos = Vector2()
var posOffset = Vector2()
export (Vector2) var dest = Vector2(700, 300)
export (float) var tolerance = 50
var isMoved
var isLocked
var clicking
var needLongClick
var isDragAndDrop = true
var mouseOver
var startTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	isMoved = false
	needLongClick = false
	clicking = false
	isLocked = false

func _process(delta):
	if isDragAndDrop and clicking:
		pos = get_viewport().get_mouse_position() + posOffset
		set_position(pos)
	if !isDragAndDrop and clicking and OS.get_ticks_msec() - startTime >= 500:
		isMoved = !isMoved
		clicking = false

func _on_Area2D_input_event(viewport, event, _shape_idx):
	if event is InputEventMouseButton and not isLocked:
		if event.is_pressed() and !needLongClick:
			clicking = true
			posOffset = self.position - get_viewport().get_mouse_position()
		else:
			if pos.x >= dest.x - tolerance and pos.x <= dest.x + tolerance and pos.y >= dest.y - tolerance and pos.y <= dest.y + tolerance:
				print("Adjusted")
				pos = dest
				isLocked = true
				set_position(pos)
			clicking = false
		if needLongClick:
			if event.is_pressed(): 
				startTime = OS.get_ticks_msec()
				clicking = true
			else:
				startTime = OS.get_ticks_msec()
				clicking = false
