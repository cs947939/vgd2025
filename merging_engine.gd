extends Node2D
var sprite_list = []

signal sprite_comm(msg: int, id: int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_character_body_2d_2_detect_1() -> void:
	sprite_list.append(1)


func _on_character_body_2d_detect_2() -> void:
	sprite_list.append(2)
