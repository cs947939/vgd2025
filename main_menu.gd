extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SceneTransition.entering_scene = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Instructions.rotation = PI/36*(sin(Time.get_unix_time_from_system()/5))
	$Instructions.scale.x = 1+0.05*sin(Time.get_unix_time_from_system()*sqrt(2)/5)
	$Instructions.scale.y = 1+0.05*sin(Time.get_unix_time_from_system()*sqrt(2)/5)
	$Instructions.modulate.a = 0.9+0.1*sin(Time.get_unix_time_from_system()*sqrt(3)/5)
	if $PlayerSelect/Button2.button_pressed:
		$PlayerSelect/Sprite2D2.visible = false
	else:
		$PlayerSelect/Sprite2D2.visible = true
	if $PlayerSelect/Button3.button_pressed:
		$PlayerSelect/Sprite2D3.visible = false
	else:
		$PlayerSelect/Sprite2D3.visible = true
	if $PlayerSelect/Button4.button_pressed:
		$PlayerSelect/Sprite2D4.visible = false
	else:
		$PlayerSelect/Sprite2D4.visible = true
	if $Levels_Button.button_pressed:
		$Sprite2D2.visible = false
	elif $Levels_Button.visible:
		$Sprite2D2.visible = true
	if $Play_Button.button_pressed:
		$Sprite2D3.visible = false
	elif $Play_Button.visible:
		$Sprite2D3.visible = true


func _on_button_2_pressed() -> void:
	GlobalVar.players = 2
	$PlayerSelect.visible = false
	$Instructions/Label2.visible = false
	$Instructions/Label.visible = true
	$Levels_Button.visible = true
	$Sprite2D2.visible = true
	$Sprite2D3.visible = true
	$Play_Button.visible = true



func _on_button_3_pressed() -> void:
	GlobalVar.players = 3
	$PlayerSelect.visible = false
	$Instructions/Label2.visible = false
	$Instructions/Label.visible = true
	$Levels_Button.visible = true
	$Sprite2D2.visible = true
	$Sprite2D3.visible = true
	$Play_Button.visible = true


func _on_button_4_pressed() -> void:
	GlobalVar.players = 4
	$PlayerSelect.visible = false
	$Instructions/Label2.visible = false
	$Instructions/Label.visible = true
	$Levels_Button.visible = true
	$Sprite2D2.visible = true
	$Sprite2D3.visible = true
	$Play_Button.visible = true
