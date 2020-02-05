extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var playerToChasePath = "player"
export (float) var acc = 2
export (float) var pullBackDistance = 600
export (float) var maxSpeed = 1000
export (float) var fadeTime = 1.5

var pullBackTimer = 0

var velocity = Vector2(0,0)
var maxSpeedInv = 1.0/maxSpeed
onready var playerToChase = get_parent().get_node("player")
var hasToPullBack = false
func pullbackForReal():
	hasToPullBack =  false
	position.x -= pullBackDistance
func pullback():
	hasToPullBack = true


func playerDirection():
	return (playerToChase.position - self.position).normalized()

func moveVector(delta):
	if (playerToChase == null):
		return Vector2(0,0)
	
	velocity = (velocity + (acc*playerDirection())) * (1.0- velocity.length() * maxSpeedInv)
	return velocity

func handlePullback(delta):
	pullBackTimer+= delta
	$AnimatedSprite.material.set_shader_param("Wrapping",1+4*pow(pullBackTimer/fadeTime,4))
	if (pullBackTimer >= fadeTime):
		pullbackForReal()
		pullBackTimer=0
		$AnimatedSprite.material.set_shader_param("Wrapping",1)

func _process(delta):
	if hasToPullBack:
		handlePullback(delta)
	else:
		move_and_slide(moveVector(delta))
		for i in range (get_slide_count()):
			var collidingBody = get_slide_collision(i).get_collider()
			if collidingBody == playerToChase:
				get_tree().change_scene("Scenes/GameOver.tscn")


func _ready():
	$AudioStreamPlayer2D.playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
