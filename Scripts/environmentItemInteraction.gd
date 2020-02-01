extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name EnvironmentItemInteraction
const Zone = preload("itemZone.gd")
const Item = preload("item.gd")

const InventoryScene = preload("res://Scenes/inventory.tscn")
var inventory
var posItems = {Zone.new(Vector2(0,0)):Item.new()}

func addZoneWithItem(zone,item):
	posItems.keys().append(zone)
	posItems[zone] = item

func pickUpAt(pos):
	for zone in posItems.keys():
		if zone.contains(pos):
			inventory.setItem(posItems[zone])

# Called when the node enters the scene tree for the first time.
func _ready():
	addZoneWithItem(Zone.new(Vector2(1,1)),Item.new("TestClick"))
	inventory = $Inventory
	pickUpAt(Vector2(1.5,1.5))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
