extends Node2D

var mynode = preload("res://players.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = mynode.instantiate()
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
