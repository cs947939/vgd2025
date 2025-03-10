extends Area2D
var exit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.process_mode = Node.PROCESS_MODE_DISABLED


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if len(get_overlapping_areas()) == 4:
		exit = true
		$Label.process_mode = Node.PROCESS_MODE_INHERIT
	elif len(get_overlapping_bodies()) == 1 and get_overlapping_bodies()[0].get_collision_layer_value(17):
		exit = true
		$Label.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		exit = false
		$Label.process_mode = Node.PROCESS_MODE_DISABLED
	if exit:
		$Label.modulate.a = (sin(Time.get_unix_time_from_system())**2)/2+1/2
	
