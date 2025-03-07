extends Area2D
var exit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(get_overlapping_areas()) == 4:
		exit = true
	elif len(get_overlapping_bodies()) == 1 and get_overlapping_bodies()[0].get_collision_layer_value(17):
		exit = true
	else:
		exit = false
