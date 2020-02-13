extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (String) var sceneToLoad = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	$Timer.start(-1)
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/"+sceneToLoad+".tscn")
	pass # Replace with function body.
