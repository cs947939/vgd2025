extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_node("/root/level_" + str(GlobalVar.current_level) + "/LevelMap/SceneTransition").change_scene("res://main_menu.tscn")
