extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_area_entered(area: Area2D) -> void:
	if animation == "default":
		play("boing")



func _on_animation_finished() -> void:
	if animation == "boing":
		play("default")


func _on_exit_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
