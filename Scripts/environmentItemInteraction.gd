extends Node2D 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
class_name EnvironmentItemInteraction
const Zone = preload("itemZone.gd")


const InventoryScene = preload("res://Scenes/inventory.tscn")
var inventory
var posItems = {
				Zone.new(Vector2(-2400,0)):"Crabe",
				Zone.new(Vector2(-1400,0)):"Bombarde",
				Zone.new(Vector2(500,0)):"Theiere",
				Zone.new(Vector2(1340,0)):"Tableau",
				Zone.new(Vector2(1800,0)):"Reveil",
				Zone.new(Vector2(2350,0)):"Miroir"
				}

func _unhandled_input(event):
	if Input.is_action_pressed("pickup_item"):
		pickUpAt(getPlayerPos())


func getPlayerPos():	
	return $Environment.get_node("player").position

func addZoneWithItem(zone,item):
	posItems.keys().append(zone)
	posItems[zone] = item

func removeFromScene(itemName):
	$Environment.get_node("decors/"+itemName).queue_free()

func pickUpAt(pos):
	var indexToRemove = -1
	for zone in posItems.keys():
		if zone.contains(pos):
			if (inventory.setItem(posItems[zone])):
				removeFromScene(posItems[zone])
				posItems.erase(zone)


func _ready():
	inventory = $Environment.get_node("cameraRig/inventory")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
