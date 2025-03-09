extends Node2D
@onready var path_follow : PathFollow2D = $LevelMap/ButtonDoor1/Path2D/PathFollow2D
@export var speed = 100
@export var button_pressed = true
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed:
		path_follow.progress += speed*delta


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	button_pressed = true
