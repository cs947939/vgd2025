extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play()


func _on_finished() -> void:
	play()
