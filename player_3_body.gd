extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var sprite_id = 3
@onready var animation_player = $AnimationPlayer3
@onready var sprite2d = $Sprite2D3
func _ready() -> void:
	sprite2d.modulate = Color(0, 1, 0)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up_3") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_3", "right_3")
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
