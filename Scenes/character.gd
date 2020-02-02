extends KinematicBody2D

export var SPEED = 20
export var JUMP = 100
export var G = 50
export var jumpCoolDown = 20
export var walkAccelerator = 0.05

var velocity = Vector2()
var on_floor = false
var hasToIdle : bool
var jumpGauge = jumpCoolDown

func moveLeft():
	print("moveLeft")
	if is_on_floor():
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = true
		if velocity.x > -SPEED:
			velocity.x -= SPEED * walkAccelerator
		elif velocity.x < -SPEED:
			velocity.x = -SPEED
	else:
		print("before air control")
		if velocity.x > -SPEED:
			print("trying to air control")
			velocity.x -= SPEED*0.05

func moveRight():
	print("moveRight")
	if is_on_floor():
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = false
		if velocity.x < SPEED:
			velocity.x += SPEED * walkAccelerator
		elif velocity.x > SPEED:
			velocity.x = +SPEED
	else:
		if velocity.x < SPEED:
			print("trying to air control")
			velocity.x += SPEED*0.05
func idle():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.scale.y = 0.9 - (sin(OS.get_ticks_msec()/500.0)+1)/80
	velocity.x = 0
func jump():
	if is_on_floor():
		on_floor = false
		if jumpCoolDown > jumpGauge*0.75:
			$AnimatedSprite.animation = "jump"
			velocity.y = -JUMP *jumpCoolDown/jumpGauge
			jumpCoolDown = 0
			return true
	return false


func  _process(delta):
	
	hasToIdle = true
	if velocity.length() != 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	if is_on_floor() && jumpCoolDown < jumpGauge:
		jumpCoolDown += 1
	if Input.is_action_pressed("ui_left"):
		moveLeft()
		hasToIdle = false
	if Input.is_action_pressed("ui_right"):
		moveRight()
		hasToIdle = false
	if Input.is_action_pressed("ui_up") and is_on_floor():
		hasToIdle = not jump()
	print(hasToIdle)
	
	if (is_on_floor()):
		if(hasToIdle):
			idle()
			$AudioStreamPlayer.play()
	
	else:
		$AnimatedSprite.animation = "jump"
		velocity.y +=G
		$AudioStreamPlayer.play()
	move_and_slide(velocity, Vector2( 0,-1 ))

