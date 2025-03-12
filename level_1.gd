extends Node2D

@onready var mynode = preload("res://players.tscn")
@onready var spawns = [Vector2(0, -100), Vector2(0, -100), Vector2(0, 0), Vector2(0, -50), Vector2(0, -50), Vector2(0, -100)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = mynode.instantiate()
	instance.position = spawns[GlobalVar.current_level - 1]
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
