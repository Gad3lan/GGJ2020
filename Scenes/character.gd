extends KinematicBody2D

export var SPEED = 20
export var JUMP = 80
export var G = 2

var velocity = Vector2()
var on_floor = false


func moveLeft():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.flip_h = true
	velocity.x = -SPEED
func moveRight():
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.flip_h = false
	velocity.x = +SPEED
func idle():
	$AnimatedSprite.animation = "idle"
	velocity.x = 0
func jump():
	if is_on_floor():
		on_floor = false
		$AnimatedSprite.animation = "jump"
		velocity.y -= JUMP
	
func  _process(delta):
	if (is_on_floor()):
		on_floor = true
	else:
		velocity.y +=G

	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if Input.is_action_pressed("ui_left"):
		moveLeft()
	elif Input.is_action_pressed("ui_right"):
		moveRight()
	elif Input.is_action_pressed("ui_up"):
		jump()
	else:
		idle()
		
		
	move_and_slide(velocity, Vector2( 0,-1 ))


func _move_and_collide():
	idle()
