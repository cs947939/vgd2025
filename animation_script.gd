extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start_running":
		play("running-loop")
	elif anim_name == "stop_running":
		play("idle")
