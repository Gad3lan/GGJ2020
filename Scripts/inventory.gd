extends Node2D



class_name Inventory

var itemCount : int
var itemName
var itemScene = null

func addItemScene():
	if not isItemRepaired():
		$nope.play()
		return false
	elif hasItem():#bouge les objets finis.
		itemScene.position.x = -200 + 100 * (itemCount%3)
		itemScene.position.y += 100 * (int(itemCount)/int(3))
		print(itemScene.position)
		itemScene.scale *= 0.25
		itemCount +=1
	$pickUpSound.play()
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	itemScene = itemSceneSource.instance()
	call_deferred("add_child",itemScene)
	return true



func setItem(itemToSet):
	itemName = itemToSet
	return addItemScene()


func isItemRepaired():
	if itemScene == null:
		return true
	return itemScene.isRepaired()


func hasItem():
	return not itemScene==null

