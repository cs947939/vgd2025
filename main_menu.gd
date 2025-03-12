extends Node2D


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Instructions.rotation = PI/24*(sin(Time.get_unix_time_from_system()/5))
	$Instructions.scale.x = 1+0.05*sin(Time.get_unix_time_from_system()*sqrt(2)/5)
	$Instructions.scale.y = 1+0.05*sin(Time.get_unix_time_from_system()*sqrt(2)/5)
	$Instructions.modulate.a = 0.75+0.25*sin(Time.get_unix_time_from_system()*sqrt(3)/5)
