extends Area2D
signal next_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(get_overlapping_areas()) == 4:
		next_level.emit()
	if len(get_overlapping_bodies()) == 1 and get_overlapping_bodies()[0].get_collision_layer_value(17):
		next_level.emit()
