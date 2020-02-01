extends Node2D



class_name Inventory

const ItemVirtualClass = preload("item.gd")
var itemVirtualObject
var itemScene = null

func addItemScene(itemName):
	var itemScene = load("res://Scenes/"+itemName+".tscn")
	itemScene = itemScene.instance()
	call_deferred("add_child",itemScene)
	
	

func setItem(itemToSet):
	itemVirtualObject = itemToSet
	print(itemVirtualObject._to_string())
	addItemScene(itemVirtualObject._to_string())
	
	
	pass

func isItemRepaired():
	return itemScene.isRepaired()


func hasItem():
	return itemScene==null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
