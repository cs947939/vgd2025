extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 0.5
@export var button_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.frame = 0
	$Path2D/PathFollow2D/DoorsUnlocked.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len($Sprite2D/Area2D.get_overlapping_bodies()) > 0:
		button_pressed = true
		$Sprite2D.frame = 5
	else:
		button_pressed = false
		$Sprite2D.frame = 1
	if button_pressed:
		$Path2D/PathFollow2D/DoorsUnlocked.modulate.a = 1
		$Path2D/PathFollow2D/DoorsLocked.modulate.a = 0
		if path_follow.progress_ratio + speed*delta < 0.5:
			path_follow.progress_ratio += speed*delta
		else:
			path_follow.progress_ratio = 0.5
	else:
		$Path2D/PathFollow2D/DoorsLocked.modulate.a = 1
		$Path2D/PathFollow2D/DoorsUnlocked.modulate.a = 0
		if path_follow.progress_ratio - speed*delta > 0:
			path_follow.progress_ratio -= speed*delta
		else:
			path_follow.progress_ratio = 0
		
