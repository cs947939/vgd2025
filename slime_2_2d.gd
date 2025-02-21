extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var sprite_id = 2
signal detect2
@onready var animation_player = $AnimationPlayer2
@onready var sprite2d = $Sprite2D2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up_2") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_2", "right_2")
	if direction:
		if abs(velocity.x) == 0:
			animation_player.play("start_running")
		velocity.x = direction * SPEED
	else:
		animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	sprite2d.flip_h = true if direction < 0 else false
	sprite2d.position.x = 3 if direction < 0 else -3

	move_and_slide()


func _on_area_2d_showslime() -> void:
	visible = false # Replace with function body.
	detect2.emit()
	process_mode = PROCESS_MODE_DISABLED


func _on_big_slime_hideslime(x1, x2, y1, y2) -> void:
	position = Vector2(x2, y2)
	visible = true
	process_mode = PROCESS_MODE_INHERIT


func _on_slime_merge_delay_stopmerge() -> void:
	pass # Replace with function body.
