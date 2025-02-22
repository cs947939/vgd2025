extends CharacterBody2D

signal detect3
const SPEED = 75.0
const JUMP_VELOCITY = -400.0
var sprite_id = 3
@onready var animation_player = $AnimationPlayer3
@onready var sprite2d = $Sprite2D3
func _ready() -> void:
	sprite2d.modulate = Color.from_hsv(0.6, 0.8, 1.4)

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
	if is_on_floor():
		if direction:
			if animation_player.current_animation == "idle":
				animation_player.play("start_running")
			velocity.x += direction * SPEED/8
			if velocity.x > 0 and velocity.x > direction*SPEED:
				velocity.x = direction*SPEED
			elif velocity.x < 0 and velocity.x <direction*SPEED:
				velocity.x = direction*SPEED
		else:
			animation_player.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED/10)
		sprite2d.flip_h = true if direction < 0 else false
		sprite2d.position.x = 3 if direction < 0 else -3

	move_and_slide()


func _on_area_2d_on_enter() -> void:
	detect3.emit()


func _on_merging_engine_sprite_comm(msg: int, id: int) -> void:
	if id == sprite_id:
		if msg == 2:
			#canmerge = true
			visible=false # Replace with function body.
			process_mode = PROCESS_MODE_DISABLED


func _on_big_slime_hideslime(x1: Variant, x2: Variant, y1: Variant, y2: Variant, x3: Variant, y3: Variant, x4: Variant, y4: Variant) -> void:
	position = Vector2(x3, y3)
	velocity = Vector2(0, 0)

	visible = true
	process_mode = PROCESS_MODE_INHERIT
