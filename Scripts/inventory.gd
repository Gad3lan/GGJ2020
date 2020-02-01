extends Node2D



class_name Inventory


var itemName
var itemScene = null

func addItemScene(itemNameToSet):
	itemName = itemNameToSet
	
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	print(itemScene)
	itemScene = itemSceneSource.instance()




func setItem(itemToSet):
	itemName = itemToSet
	print(itemName)
	addItemScene(itemName)
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
