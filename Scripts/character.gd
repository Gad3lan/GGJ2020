extends KinematicBody2D

export var SPEED = 40
export var G = 120

var screen_size
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

func moveLeft():
	$AnimatedSprite.flip_h = true
	velocity.x -= SPEED
func moveRight():
	velocity.x += SPEED
func idle():
	velocity.x = 0
	
func  _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		moveLeft()
	elif Input.is_action_pressed("ui_right"):
		moveRight()
	else:
		idle()
		
	position += velocity * delta

func _move_and_collide():
	idle()
