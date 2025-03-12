extends Button
@onready var enabled = false
@onready var passed = false
@onready var names = ["Button", "Button2", "Button3", "Button4", "Button5", "Button6"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enabled:
		self.disabled = false


func _on_button_up() -> void:
	GlobalVar.current_level = names.find(self.name) + 1
	get_tree().change_scene_to_file("res://level_" + str(names.find(self.name) + 1) + ".tscn")
