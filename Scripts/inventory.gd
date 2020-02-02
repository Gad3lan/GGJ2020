extends Node2D



class_name Inventory

var itemCount : int = 0
var itemName
var itemScene = null

func addItemScene():
	if not isItemRepaired():
		$nope.play()
		return false
	elif hasItem():#bouge les objets finis.
		itemScene.position.x = -400 + 100 * itemCount%2
		itemScene.position.y += 70 + 100 * itemCount/2
		itemScene.scale *= 0.25
		itemCount +=1
	$pickUpSound.play()
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	itemScene = itemSceneSource.instance()
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



