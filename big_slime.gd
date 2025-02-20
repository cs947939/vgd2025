extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
signal delaystart
signal cooldownstart
signal mergecheck
signal hideslime(x1, x2, y1, y2)
var sprite_id = 5 
var allowsplit = false
var allowmerge = true
func _ready() -> void:
	visible=false
	process_mode = PROCESS_MODE_DISABLED
func split(x1, x2, y1, y2) -> void:
	print("Different Input")
	hideslime.emit(x1, x2, y1, y2)
	cooldownstart.emit()
	allowmerge = false
	visible = false
	allowsplit = false
	process_mode = PROCESS_MODE_DISABLED

	
func _physics_process(delta: float) -> void:
	var p1press = []
	var p2press =[]
	var p3press =[]
	var p4press = []
	var directions = ['up', 'down', 'left', 'right']
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left_2", "right_2")
	if Input.is_action_pressed("up_1"):
		p1press.append(directions[0])
	if Input.is_action_pressed("up_2"):
		p2press.append(directions[0])
	if Input.is_action_pressed("up_3"):
		p3press.append(directions[0])
	if Input.is_action_pressed("up_4"):
		p4press.append(directions[0])
	if Input.is_action_pressed("down_1"):
		p1press.append(directions[1])
	if Input.is_action_pressed("down_2"):
		p2press.append(directions[1])
	if Input.is_action_pressed("down_3"):
		p3press.append(directions[1])
	if Input.is_action_pressed("down_4"):
		p4press.append(directions[1])
	if Input.is_action_pressed("left_1"):
		p1press.append(directions[2])
	if Input.is_action_pressed("left_2"):
		p2press.append(directions[2])
	if Input.is_action_pressed("left_3"):
		p3press.append(directions[2])
	if Input.is_action_pressed("left_4"):
		p4press.append(directions[2])
	if Input.is_action_pressed("right_1"):
		p1press.append(directions[3])
	if Input.is_action_pressed("right_2"):
		p2press.append(directions[3])	
	if Input.is_action_pressed("right_3"):
		p3press.append(directions[3])
	if Input.is_action_pressed("right_4"):
		p4press.append(directions[3])	
	for i in range(4):
		if directions[i] in p1press:
			for ii in range(3):
				if directions[ii + 1] in p2press:
					for iii in range(2):
						if directions[iii + 2] in p3press:
							if directions[3] in p4press:
								print("Split!")
								break
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
	mergecheck.emit()
	if allowmerge == true:
		delaystart.emit()
		visible = true # Replace with function body.
		process_mode = PROCESS_MODE_INHERIT

		


func _on_slime_input_delay_timeout() -> void:
	allowsplit = true


func _on_slime_merge_delay_timeout() -> void:
	process_mode = PROCESS_MODE_INHERIT
	print("allow merge")
	allowmerge= true
	process_mode = PROCESS_MODE_DISABLED


func _on_slime_merge_delay_allowmerge() -> void:
	allowmerge = true


func _on_slime_merge_delay_stopmerge() -> void:
	pass
