extends Node2D



class_name Inventory

var itemCount : int = 0
var itemName
var itemScene = null

func moveItem():
	itemScene.position.x = 150 * (itemCount%3)
	itemScene.position.y += 50 + 100 * (int(itemCount)/int(3))
	itemScene.scale *= 0.35
	itemCount +=1
	get_parent().get_parent().get_node("fantom").pullback()

func addItemScene():
	if not isItemRepaired():
		$nope.play()
		return false
	
	var soundName = itemName + "Sound"
	get_node(soundName).play()
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	itemScene = itemSceneSource.instance()
	itemScene.inventory = self
	itemScene.position = Vector2(450, 200)
	call_deferred("add_child",itemScene)
	return true

func itemRepairedNumber():
	return itemCount

func setItem(itemToSet):
	itemName = itemToSet
	return addItemScene()

func hasItem():
	return not itemScene==null

func isItemRepaired():
	if itemScene == null:
		return true
	return itemScene.isRepaired()



