extends Area2D
signal next_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($"CharacterBody2D2/1" in get_overlapping_areas() and $"CharacterBody2D3/3" in get_overlapping_areas() and $"CharacterBody2D4/4" in get_overlapping_areas() and $"CharacterBody2D/2" in get_overlapping_areas()):
		next_level.emit
