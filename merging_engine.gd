extends Node2D
var sprite_list = []
var check_sprite_list = []

signal sprite_comm(msg: int, id: int)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite_list = $"../CharacterBody2D2/1".get_overlapping_areas()
	if $"../CharacterBody2D/2" in sprite_list:
		check_sprite_list = $"../CharacterBody2D/2".get_overlapping_areas()
		for item in check_sprite_list:
			if not item in sprite_list:
				sprite_list.append(item)
	if $"../CharacterBody2D3/3" in sprite_list:
		check_sprite_list = $"../CharacterBody2D3/3".get_overlapping_areas()
		for item in check_sprite_list:
			if not item in sprite_list:
				sprite_list.append(item)
	if len(sprite_list) == 4:
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


func _on_area_2d_rmdetect_1() -> void:
	
	for i in range(len(sprite_list)):
		var entry = sprite_list[i]
		if entry == 1:
			sprite_list.remove_at(i)
			return


func _on_character_body_2d_rmdetect_2() -> void:
	for i in range(len(sprite_list)):
		var entry = sprite_list[i]
		if entry == 2:
			sprite_list.remove_at(i)
			return


func _on_character_body_2d_3_rmdetect_3() -> void:
	for i in range(len(sprite_list)):
		var entry = sprite_list[i]
		if entry == 3:
			sprite_list.remove_at(i)
			return


func _on_character_body_2d_4_rmdetect_4() -> void:
	for i in range(len(sprite_list)):
		var entry = sprite_list[i]
		if entry == 4:
			sprite_list.remove_at(i)
			return
