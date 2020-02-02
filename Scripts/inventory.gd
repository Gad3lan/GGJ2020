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
		itemScene.position.x = 150 * (itemCount%3)
		itemScene.position.y += 50 + 100 * (int(itemCount)/int(3))
		print(itemScene.position)
		itemScene.scale *= 0.35
		itemCount +=1
	$pickUpSound.play()
	var itemSceneSource = load("res://Scenes/"+itemName+".tscn")
	itemScene = itemSceneSource.instance()
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



