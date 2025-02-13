extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_1", "right_1")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func _on_on_enter():
	visible = false
	print("entered")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Entered Body") # Replace with function body.


func _on_area_2d_showslime() -> void:
	visible=false # Replace with function body.
	process_mode = PROCESS_MODE_DISABLED


func _on_big_slime_hideslime() -> void:
	visible = true
	process_mode = PROCESS_MODE_INHERIT
