extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 0.5
@export var button_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed:
		if path_follow.progress_ratio + speed*delta < 0.5:
			path_follow.progress_ratio += speed*delta
		else:
			path_follow.progress_ratio = 0.5



func _on_area_2d_body_entered(body: Node2D) -> void:
	
	button_pressed = true
	$Sprite2D.frame = 5
