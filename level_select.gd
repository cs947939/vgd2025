extends Node2D
@onready var button_list = [$Button, $Button2, $Button3, $Button4, $Button5, $Button6, null]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(GlobalVar.level):
		if button_list[i] != null:
			button_list[i].enabled = true
		if i-1 >= 0:
			button_list[i-1].passed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
