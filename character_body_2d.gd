extends CharacterBody2D
const SPEED = 75.0
const JUMP_VELOCITY = -200.0
signal mergecheck3
var canmerge = true
var sprite_id = 1
var keys = []
signal detect1
@onready var animation_player = $AnimationPlayer
@onready var sprite2d = $Sprite2D
func _ready() -> void:
	sprite2d.modulate = Color.from_hsv(0, 0.8, 1.4)

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
	if (direction > 0 and velocity.x > direction*SPEED) or (direction < 0 and velocity.x < direction*SPEED):
		move_toward(velocity.x, direction*SPEED, ((SPEED) if is_on_floor() else (SPEED/200)))
	else:
		if direction:
			if animation_player.current_animation == "idle":
				animation_player.play("start_running")
			
			if is_on_floor():
				velocity.x += direction * SPEED/8
			else:
				velocity.x += direction * SPEED/16
	if not direction:
		animation_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, ((SPEED/10) if is_on_floor() else (SPEED/200)))
	sprite2d.flip_h = true if direction < 0 else false
	sprite2d.position.x = 3 if direction < 0 else -3
	
	
	
	move_and_slide()




func _on_on_enter():
	visible = false



func _on_area_2d_body_entered(body: Node2D) -> void:
 # Replace with function body.
	detect1.emit()


func _on_area_2d_showslime() -> void:
	mergecheck3.emit()
	if canmerge == true:
		visible=false # Replace with function body.
		process_mode = PROCESS_MODE_DISABLED


func _on_big_slime_hideslime(direction, x, xx, xxx) -> void:
	process_mode = PROCESS_MODE_INHERIT
	global_position.x = $"../BigSlime".global_position.x + (20 if direction == "right" else (-20 if direction == "left" else 0))
	global_position.y = $"../BigSlime".global_position.y + (20 if direction == "down" else (-20 if direction == "up" else 0))
	velocity.x = $"../BigSlime".velocity.x  + (200 if direction == "right" else (-200 if direction == "left" else 0))
	velocity.y = $"../BigSlime".velocity.y  + (200 if direction == "down" else (-200 if direction == "up" else 0))
	visible = true
	if not direction=="down":
		move_and_slide()

func _on_hideslime() -> void:
	visible = true


func _on_slime_merge_delay_allowmerge() -> void:
	canmerge = true


func _on_slime_merge_delay_stopmerge() -> void:
	canmerge = false	
	#TODO: shutoff area2d here


func _on_slime_merge_delay_timeout() -> void:
	canmerge = true


func _on_merging_engine_sprite_comm(msg: int, id: int) -> void:
	if id == sprite_id:
		if msg == 2:
			canmerge = true
			visible=false # Replace with function body.
			process_mode = PROCESS_MODE_DISABLED


func _on_area_2d_on_enter() -> void:
	detect1.emit()



	


func _on_damage_area_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
