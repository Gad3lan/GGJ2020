extends Node

class_name Zone
var pos
var reach
func _init(posToSet, reachToSet = Vector2(200,200)):
	pos = posToSet
	reach = reachToSet

func contains(what):
	return what.x > pos.x and what.x < pos.x + reach.x 
