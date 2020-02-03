extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var playerToChasePath = "player"
export (float) var acc = 2
export (float) var pullBackDistance = 600
export (float) var maxSpeed = 1000

var velocity = Vector2(0,0)
var maxSpeedInv = 1/maxSpeed
onready var playerToChase = get_parent().get_node("player")

func pullback():
	position.x -= pullBackDistance

func playerDirection():
	return (playerToChase.position - self.position).normalized()

func moveVector(delta):
	velocity = (velocity + (acc*playerDirection())) *(1- velocity.length() * maxSpeedInv)
	velocity.x = min(velocity.x, 100)
	return velocity

func _process(delta):
	if (playerToChase == null):
		return
	
	move_and_slide(moveVector(delta))
	

func _ready():
	$AudioStreamPlayer2D.playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
