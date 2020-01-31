extends Node2D



class_name Inventory



const Item = preload("item.gd")

var item = null
func setItem(itemToSet):
	print("hey")
	item = itemToSet
	print(item._to_string())
	pass

func isItemRepaired():
	return item.isRepaired()


func hasItem():
	return false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
