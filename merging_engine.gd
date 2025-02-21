extends Node2D
var sprite_list = []

signal sprite_comm(msg: int, id: int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if 1 in sprite_list:
		if 2 in sprite_list:
			if 3 in sprite_list:
				if 4 in sprite_list:
					sprite_list = []
					sprite_comm.emit(2, 1)
					sprite_comm.emit(2, 2)
					sprite_comm.emit(2, 3)
					sprite_comm.emit(2, 4)
					sprite_comm.emit(3, 5)
					
					


func _on_character_body_2d_2_detect_1() -> void:
	print(1)
	sprite_list.append(1)


func _on_character_body_2d_detect_2() -> void:
	print(2)
	sprite_list.append(2)


func _on_character_body_2d_3_detect_3() -> void:
	print(3)
	sprite_list.append(3)


func _on_character_body_2d_4_detect_4() -> void:
	print(4)
	sprite_list.append(4)
