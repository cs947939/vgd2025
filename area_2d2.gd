extends Area2D
signal showslime
signal mergecheck2
var allowmerge = true
func _area_entered2(area: Area2D) -> void:
	mergecheck2.emit()
	if allowmerge == true:
		showslime.emit()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_monitoring(true)
	area_entered.connect(_area_entered2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_slime_merge_delay_timeout() -> void:

	allowmerge= true
	set_monitoring(true)


func _on_slime_merge_delay_allowmerge() -> void:
	allowmerge = true


func _on_slime_merge_delay_stopmerge() -> void:
	set_monitoring(false)
