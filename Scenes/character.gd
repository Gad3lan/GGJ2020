extends KinematicBody2D

const SPEED = 400
const G = 1200

var screen_size
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

func moveLeft():
	$AnimatedSprite.flip_h = true
	velocity.x += SPEED
func moveRight():
	velocity.x -= SPEED
func idle():
	velocity.x = 0
	
func  _process(delta):
	$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		moveLeft()
	elif Input.is_action_pressed("ui_right"):
		moveRight()
	else:
		idle()
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
