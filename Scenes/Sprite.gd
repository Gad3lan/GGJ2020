extends Sprite

func _process(delta):
	$".".rotation_degrees = (15*sin(OS.get_ticks_msec()/500.0))
