extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name Zone
var pos
var reach
func _init(posToSet, reachToSet = Vector2(200,200)):
	pos = posToSet
	reach = reachToSet
	

func contains(what):
	return what.x > pos.x and what.x < pos.x + reach.x 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
