extends Node2D

var lastZIndex = 0
var lastNodeDragged = null

func dragNode(node):
	if lastNodeDragged != node:
		var z = lastZIndex + 3
		node.z_index = z
		lastZIndex = z
		lastNodeDragged = node

