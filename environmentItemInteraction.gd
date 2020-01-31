extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name EnvironmentItemInteraction
const Zone = preload("itemZone.gd")
const Item = preload("item.gd")
const Inventory = preload("inventory.gd")
var inventory
var posItems = {Zone.new(Vector2(0,0)):Item.new()}

func pickUpAt(pos):
	for zone in posItems.keys():
		if zone.contains(pos):
			inventory.setItem(posItems[zone])

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = Inventory.new()
	pickUpAt(Vector2(0.5,0.5))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
