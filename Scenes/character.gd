extends KinematicBody2D

export var SPEED = 20
export var JUMP = 60
export var G = 10

var velocity = Vector2()
var on_floor = false
var hasToIdle : bool


func moveLeft():
	if is_on_floor():
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = true
		velocity.x = -SPEED
func moveRight():
	if is_on_floor():
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = false
		velocity.x = +SPEED
func idle():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.scale.y = 0.9 - (sin(OS.get_ticks_msec()/500.0)+1)/80
	velocity.x = 0
func jump():
	if is_on_floor():
		on_floor = false
		$AnimatedSprite.animation = "jump"
		velocity.y = -JUMP


func  _process(delta):
	hasToIdle = true
	if velocity.length() != 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if Input.is_action_pressed("ui_left") and is_on_floor():
		moveLeft()
		hasToIdle = false
	if Input.is_action_pressed("ui_right") and is_on_floor():
		moveRight()
		hasToIdle = false
	if Input.is_action_pressed("ui_up") and is_on_floor():
		jump()
		hasToIdle = false
	
	else:
		if (is_on_floor()):
			if(hasToIdle):
				idle()
				$AudioStreamPlayer.play()
				
		else:
			$AnimatedSprite.animation = "jump"
			velocity.y +=G
			$AudioStreamPlayer.play()

	move_and_slide(velocity, Vector2( 0,-1 ))

