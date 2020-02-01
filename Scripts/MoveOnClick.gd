extends Node2D

var mouseOver = false
var mouseClicked = false
var nodeDragged = false
var isDraggable = true
var lastNodeDragged = false

var overPlace = false
var isUnplacable = false
var nodePlacedIn = null
var posOffset

onready var object = get_tree().get_current_scene()

func placed(nodeIn):
	if nodeIn != object.get_node("Object"):
		nodePlacedIn = nodeIn
	else:
		nodePlacedIn = null

func anotherNodeIsDragged(zTop, unUsed):
	lastNodeDragged = false
	if self == zTop and not nodeDragged:
		if not nodePlacedIn:
			isDraggable = true
		else:
			isUnplacable = true
	elif not nodeDragged:
		isDraggable = false
		isUnplacable = false

func _process(delta):
	if not nodePlacedIn:
		if Input.is_action_pressed("click"):
			if not mouseClicked and mouseOver:
				nodeDragged = true
				posOffset = get_viewport().get_mouse_position() - self.global_position
			mouseClicked = true
		else: 
			mouseClicked = false
			nodeDragged = false
		if nodeDragged and isDraggable:
			object.dragNode(self)
			set_position(get_viewport().get_mouse_position() + posOffset)
	else:
		self.z_index = nodePlacedIn.z_index + 1
		if Input.is_action_just_pressed("unplace") and isUnplacable:
			self.z_index += 2


## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#var pos = Vector2()
#var posOffset = Vector2()
#export (Vector2) var dest = Vector2(700, 300)
#export (float) var tolerance = 50
#var isMoved
#var clicking
#var needLongClick
#var isDragAndDrop = true
#var mouseOver
#var startTime = 0
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	isMoved = false
#	needLongClick = false
#	clicking = false
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(get_overlapping_areas())
#	print(get_instance_id())
#	if isDragAndDrop and clicking:
#		print(posOffset)
#		pos = get_viewport().get_mouse_position() + posOffset
#		set_position(pos)
#	if !isDragAndDrop and clicking and OS.get_ticks_msec() - startTime >= 500:
#		isMoved = !isMoved
#		clicking = false
#
#func _on_Area2D_input_event(viewport, event, _shape_idx):
#	if event is InputEventMouseButton:
#		if event.is_pressed() and !needLongClick:
#			clicking = true
#			posOffset = self.position - get_viewport().get_mouse_position()
#		else:
#			if pos.x >= dest.x - tolerance and pos.x <= dest.x + tolerance and pos.y >= dest.y - tolerance and pos.y <= dest.y + tolerance:
#				print("Adjusted")
#				pos = dest
#				set_position(pos)
#			clicking = false
#		if needLongClick:
#			if event.is_pressed(): 
#				startTime = OS.get_ticks_msec()
#				clicking = true
#			else:
#				startTime = OS.get_ticks_msec()
#				clicking = false
