extends KinematicBody2D


var speed = 200
const jump_power = -400
var velocity = Vector2()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	
# Move the body	
	if Input.is_action_pressed('ui_right'):
		velocity.x = speed
	elif Input.is_action_pressed('ui_left'):
		velocity.x = -speed
	else:
		velocity.x = 0
		
# Animate the movement		
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
		
	velocity = move_and_slide(velocity)
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	



func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	$AnimatedSprite.stop()
	velocity.x = 0
	velocity.y = 0
