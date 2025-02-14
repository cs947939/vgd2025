extends Area2D
signal showslime
var allowmerge = true
func _area_entered2(area: Area2D) -> void:
	if allowmerge == true:
		showslime.emit()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_monitoring(true)
	area_entered.connect(_area_entered2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_big_slime_cooldownstart() -> void:
	print("delay start")
	allowmerge= false


func _on_slime_merge_delay_timeout() -> void:
	process_mode = PROCESS_MODE_INHERIT
	print("allow merge")
	allowmerge= true
	process_mode = PROCESS_MODE_DISABLED
