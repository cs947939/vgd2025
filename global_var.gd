extends Node2D
var level = 1
var current_level = 1
var max_level = 10

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var exit = get_node("Exit")
	if exit != null:
		exit.next_level.connect(self._on_level_pass)
	load_level()

func load_level():
	print("Loading...")

	var save_file = FileAccess.open("user://savefile.save", FileAccess.READ)
	if not FileAccess.file_exists("user://savefile.save"):
		print("Aborting, no savefile")
		return

	level = save_file.get_line()
	save_file.close()

func save_level():
	print("Saving...")

	var save_file = FileAccess.open("user://savefile.save", FileAccess.WRITE)
	save_file.store_line(level)
	save_file.close()

func _on_level_pass():
	if current_level == level:
		level += 1
		current_level += 1
		save_level()
		if level > max_level:
			pass
		else:
			get_tree().change_scene_to_file("res://level_" + str(current_level) + ".tscn")
	else:
		current_level += 1
		get_tree().change_scene_to_file("res://level_" + str(current_level) + ".tscn")
