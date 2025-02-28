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
	if $"../CharacterBody2D4/4" in sprite_list:
		check_sprite_list = $"../CharacterBody2D4/4".get_overlapping_areas()
		for item in check_sprite_list:
			if not item in sprite_list:
				sprite_list.append(item)
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
	if $"../CharacterBody2D/2" in sprite_list:
		check_sprite_list = $"../CharacterBody2D/2".get_overlapping_areas()
		for item in check_sprite_list:
			if not item in sprite_list:
				sprite_list.append(item)
	if $"../CharacterBody2D4/4" in sprite_list:
		check_sprite_list = $"../CharacterBody2D4/4".get_overlapping_areas()
		for item in check_sprite_list:
			if not item in sprite_list:
				sprite_list.append(item)
	if len(sprite_list) == 4 and $"../CharacterBody2D/2" in sprite_list and $"../CharacterBody2D3/3" in sprite_list and $"../CharacterBody2D4/4" in sprite_list and $"../CharacterBody2D2/1" in sprite_list:
		sprite_comm.emit(2, 1)
		sprite_comm.emit(2, 2)
		sprite_comm.emit(2, 3)
		sprite_comm.emit(2, 4)
		sprite_comm.emit(3, 5)
					
					
