extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var playerToChasePath = "player"
export (float) var speed = 20
onready var playerToChase = get_tree().get_root().get_node(playerToChasePath)

func playerDirection():
	return (self.position - playerToChase.position).normalized()

func moveVector(delta):
	return speed * Vector2(speed,0)

func _process(delta):
	print(get_tree().get_node_count())
	move_and_slide(moveVector(delta))

func _ready():
	$AudioStreamPlayer2D.playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
