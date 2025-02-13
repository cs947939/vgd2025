extends Area2D
signal showslime
func _area_entered2(area: Area2D) -> void:
	showslime.emit()
	print("area entered")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_monitoring(true)
	area_entered.connect(_area_entered2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
