extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal hideslime(x1, x2, y1, y2)
func _ready() -> void:
	visible=false
	process_mode = PROCESS_MODE_DISABLED
func split(x1, x2, y1, y2) -> void:
	print("Different Input")
	hideslime.emit(x1, x2, y1, y2)
	visible = false
	process_mode = PROCESS_MODE_DISABLED
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_2", "right_2")
	if Input.is_action_pressed("left_1") and Input.is_action_pressed("right_2"):
		split()
	if Input.is_action_pressed("right_1") and Input.is_action_pressed("left_2"):
		split()
	if Input.is_action_pressed("up_1") and Input.is_action_pressed("down_2"):
		split()
	if Input.is_action_pressed("down_1") and Input.is_action_pressed("up_2"):
		split()
	if direction:
		velocity.x = (direction * SPEED )/ 4
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	var direction2 := Input.get_axis("left_1", "right_1")
	if direction2:
		velocity.x = (direction2 * SPEED )/ 4
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == direction2:
		velocity.x = direction2 * SPEED
	else:
		pass
		
	move_and_slide()


func _on_area_2d_showslime() -> void:
	visible = true # Replace with function body.
	process_mode = PROCESS_MODE_INHERIT
