extends CharacterBody2D


const SPEED = 75.0
const JUMP_VELOCITY = -400.0
signal delaystart
signal cooldownstart
signal mergecheck
signal hideslime(x1, x2, y1, y2, x3, y3, x4, y4)
var sprite_id = 5 
var allowsplit = false
var allowmerge = true
func _ready() -> void:
	visible=false
	process_mode = PROCESS_MODE_DISABLED
func split(direction1, direction2, direction3, direction4) -> void:
	print("Different Input")
	hideslime.emit(direction1, direction2, direction3, direction4)
	cooldownstart.emit()
	allowmerge = false
	visible = false
	allowsplit = false
	process_mode = PROCESS_MODE_DISABLED

	
func _physics_process(delta: float) -> void:
	var p1press = "NA"
	var p2press = "NA"
	var p3press = "NA"
	var p4press = "NA"
	var directions = ['up', 'down', 'left', 'right']
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_2", "right_2")
	var direction2 := Input.get_axis("left_1", "right_1")
	var direction3 := Input.get_axis("left_3", "right_3")
	var direction4 := Input.get_axis("left_4", "right_4")
	if Input.is_action_pressed("up_1"):
		p1press = (directions[0])
	if Input.is_action_pressed("up_2"):
		p2press = (directions[0])
	if Input.is_action_pressed("up_3"):
		p3press = (directions[0])
	if Input.is_action_pressed("up_4"):
		p4press = (directions[0])
	if Input.is_action_pressed("down_1"):
		p1press  = (directions[1])
	if Input.is_action_pressed("down_2"):
		p2press  = (directions[1])
	if Input.is_action_pressed("down_3"):
		p3press  = (directions[1])
	if Input.is_action_pressed("down_4"):
		p4press = (directions[1])
	if Input.is_action_pressed("left_1"):
		p1press = (directions[2])
	if Input.is_action_pressed("left_2"):
		p2press = (directions[2])
	if Input.is_action_pressed("left_3"):
		p3press = (directions[2])
	if Input.is_action_pressed("left_4"):
		p4press = (directions[2])
	if Input.is_action_pressed("right_1"):
		p1press = (directions[3])
	if Input.is_action_pressed("right_2"):
		p2press = (directions[3])	
	if Input.is_action_pressed("right_3"):
		p3press = (directions[3])
	if Input.is_action_pressed("right_4"):
		p4press = (directions[3])	
	if p1press != p2press && p2press != p3press && p3press != p4press:
		if p1press != p3press && p1press != p4press && p4press != "NA" && p3press != "NA" && p2press != "NA" && p1press != "NA":
			split(p1press, p2press, p3press, p4press)
	var final_direction = 0
	if direction:
		final_direction += direction
	if direction2:
		final_direction += direction2
	if direction3:
		final_direction += direction3
	if direction4:
		final_direction += direction4
	if final_direction == 0:
		velocity.x = move_toward(velocity.x, 0, ((SPEED/10) if is_on_floor() else (SPEED/200)))
	else:
		if is_on_floor():
			velocity.x += final_direction*SPEED/32
		else:
			velocity.x += final_direction*SPEED/64
		if velocity.x > 0 and velocity.x > final_direction*SPEED/4:
			velocity.x = final_direction*SPEED/4
		elif velocity.x < 0 and velocity.x <final_direction*SPEED/4:
			velocity.x = final_direction*SPEED/4
	move_and_slide()
func _on_area_2d_showslime() -> void:
	mergecheck.emit()
	if allowmerge == true:
		delaystart.emit()
		visible = true # Replace with function body.
		process_mode = PROCESS_MODE_INHERIT
		
		global_position.x = ($"../CharacterBody2D2".global_position.x+$"../CharacterBody2D".global_position.x+$"../CharacterBody2D3".global_position.x+$"../CharacterBody2D4".global_position.x)/4
		global_position.y = ($"../CharacterBody2D2".global_position.y+$"../CharacterBody2D".global_position.y+$"../CharacterBody2D3".global_position.y+$"../CharacterBody2D4".global_position.y)/4

		


func _on_slime_input_delay_timeout() -> void:
	allowsplit = true


func _on_slime_merge_delay_timeout() -> void:
	process_mode = PROCESS_MODE_INHERIT
	allowmerge= true
	process_mode = PROCESS_MODE_DISABLED


func _on_slime_merge_delay_allowmerge() -> void:
	allowmerge = true


func _on_slime_merge_delay_stopmerge() -> void:
	pass


func _on_merging_engine_sprite_comm(msg: int, id: int) -> void:
	if sprite_id == id:
		if msg == 3:
			delaystart.emit()
			visible = true # Replace with function body.
			process_mode = PROCESS_MODE_INHERIT
			global_position.x = ($"../CharacterBody2D2".global_position.x+$"../CharacterBody2D".global_position.x+$"../CharacterBody2D3".global_position.x+$"../CharacterBody2D4".global_position.x)/4
			global_position.y = ($"../CharacterBody2D2".global_position.y+$"../CharacterBody2D".global_position.y+$"../CharacterBody2D3".global_position.y+$"../CharacterBody2D4".global_position.y)/4
			velocity.x = ($"../CharacterBody2D2".velocity.x+$"../CharacterBody2D".velocity.x+$"../CharacterBody2D3".velocity.x+$"../CharacterBody2D4".velocity.x)/4
			velocity.y = ($"../CharacterBody2D2".velocity.y+$"../CharacterBody2D".velocity.y+$"../CharacterBody2D3".velocity.y+$"../CharacterBody2D4".velocity.y)/4


func _on_spring_area_5_body_entered(node: Node2D) -> void:
	velocity.y = -200
