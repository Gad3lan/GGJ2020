extends Node

class_name Item

var repaired = false
var title = "Untitled"
func _init(titleToSet = "Untitled"):
	title = titleToSet
	pass

func _to_string():
	return title


func isRepaired():
	return repaired

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
