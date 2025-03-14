extends Button
@onready var enabled = false
@onready var passed = false
@onready var names = ["Button", "Button2", "Button3", "Button4", "Button5", "Button6"]
@onready var shadow_names = [$"../Sprite2D", $"../Sprite2D2", $"../Sprite2D3", $"../Sprite2D4", $"../Sprite2D5", $"../Sprite2D6"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enabled:
		self.disabled = false
	if button_pressed:
		shadow_names[names.find(self.name)].visible = false
	else:
		shadow_names[names.find(self.name)].visible = true
		
		


func _on_button_up() -> void:
	GlobalVar.current_level = names.find(self.name) + 1
	$"../sfx/Button_Click".play_sfx()
	$"../SceneTransition".change_scene("res://level_" + str(names.find(self.name) + 1) + ".tscn")


func _on_mouse_entered() -> void:
	$"../sfx/Button_Hover".play_sfx()
