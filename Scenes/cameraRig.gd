extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player

func _process(delta):
	print(player.position.x)
	position.x = player.position.x - 200
# Called when the node enters the scene tree for the first time.
func _ready():
	print("hey cam rig is ready")
	print (get_parent().get_node("player"))
	player = get_parent().get_node("player")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
