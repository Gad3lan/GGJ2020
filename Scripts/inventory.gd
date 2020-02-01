extends Node2D



class_name Inventory


var itemName
var itemScene = null

func addItemScene():
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	print("res://Scenes/"+itemName+".tscn")
	itemScene = itemSceneSource.instance()
	print(itemScene)
	print(itemScene.position.x)
	print(itemScene.position.y)
	call_deferred("add_child",itemScene)




func setItem(itemToSet):
	itemName = itemToSet
	print(itemName)
	addItemScene()
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
