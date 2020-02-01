extends Node2D

var objectNode
var children = []

func _ready():
	objectNode = get_node("Object")
	children = objectNode.get_children()
	children
	print(children)
	print(objectNode.get_node("Engrenage"))
