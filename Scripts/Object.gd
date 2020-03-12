extends Node2D

var objectNode
var children = []
onready var soundPlayer = get_node("Object/SoundPlayer")
export (String) var sceneName = ""
var inventory
var isRepaired

func _ready():
	objectNode = get_node("Object")
	children = objectNode.get_children()
	children.remove(children.size()-1)
	children.remove(children.size()-1)
	for i in range(0, children.size()):
		children[i] = children[i].get_node("Area2D")
	
func isComplete():
	var res = true
	for child in children:
		res = res and child.get("isLocked")
	if res:
		inventory.moveItem()
		#soundPlayer.get_node("Complete").play()
		isRepaired = true
	return res

func isRepaired():
	return isRepaired
