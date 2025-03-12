extends Node2D
var level
var current_level
var max_level = 6
var exit_unconnected = true
var exit = null
var input_allowed = true
var players = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	current_level = 1
	level = 1
	load_level()

func load_level():
	var save_file = FileAccess.open("user://savefile.save", FileAccess.READ)
	if not FileAccess.file_exists("user://savefile.save"):
		print("Aborting, no savefile")
		return

	level = int(save_file.get_line())
	print(level)
	save_file.close()

func save_level():
	print("Saving...")

	var save_file = FileAccess.open("user://savefile.save", FileAccess.WRITE)
	save_file.store_line(str(level))
	save_file.close()
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_select") and input_allowed and get_node("/root/level_" + str(current_level) + "/LevelMap/Exit") and get_node("/root/level_" + str(current_level) + "/LevelMap/Exit").exit:
		input_allowed = false
		if current_level == level or current_level == max_level:
			level += 1
			current_level += 1
			save_level()  
			if level > max_level:
				level = 7
				save_level()
				get_tree().change_scene_to_file("res://end.tscn")
				
			else:
				print("loading level" + str(current_level))
				get_tree().change_scene_to_file("res://level_" + str(current_level) + ".tscn")
		else:
			print("loading level" + str(current_level))
			current_level += 1
			get_tree().change_scene_to_file("res://level_" + str(current_level) + ".tscn")
		input_allowed = true
