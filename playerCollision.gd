extends Area2D
signal onEnter
signal rmdetect1
func _on_area_2d_area_entered(area):
	print("Area Entered")
	onEnter.emit()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_monitoring(true)
	area_entered.connect(_on_area_2d_area_entered)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_exited(area: Area2D) -> void:
	rmdetect1.emit()
