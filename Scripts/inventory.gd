extends Node2D



class_name Inventory

var itemCount : int
var itemName
var itemScene = null

func addItemScene():
	if not isItemRepaired():
		#rajouter un son/un indicateur pour dire au joueur 
		# qu'il ne peut pas récupérer l'objet
		return false
	elif hasItem():#bouge les objets finis.
		itemScene.position.x = -400 + 200 * itemCount
		itemScene.position.y += 70
		itemScene.scale *= 0.75
		itemCount +=1
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
	return itemScene.isComplete()


func hasItem():
	return not itemScene==null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
