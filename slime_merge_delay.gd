extends Timer
signal allowmerge
signal stopmerge

var canmerge = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_big_slime_cooldownstart() -> void:
	canmerge = false
	start(1)


func _on_big_slime_mergecheck() -> void:
	if canmerge == true:
		allowmerge.emit()
	else:
		stopmerge.emit()
		


func _on_timeout() -> void:
	canmerge = true


func _on_area_2d_mergecheck_2() -> void:
	if canmerge == true:
		allowmerge.emit()
	else:
		stopmerge.emit()


func _on_character_body_2d_2_mergecheck_3() -> void:
	if canmerge == true:
		allowmerge.emit()
	else:
		stopmerge.emit()
