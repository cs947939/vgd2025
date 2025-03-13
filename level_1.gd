extends Node2D

@onready var mynode = preload("res://players.tscn")
@onready var spawns = [Vector2(0, -100), Vector2(0, -100), Vector2(0, 0), Vector2(0, -50), Vector2(0, -50), Vector2(0, -100)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = mynode.instantiate()
	instance.position = spawns[GlobalVar.current_level - 1]
	add_child(instance)
	if GlobalVar.current_level == 1:
		if GlobalVar.players >= 3:
			$Label7.visible = true
			$Label3.visible = false
			if GlobalVar.players >= 4:
				$Label8.visible = true
				$Label2.visible = false
				$Label6/Sprite2D.texture = load("res://973eaedf89f6405 (3)-1.png-1.png-1.png-3.png-2.png.png")
				$Label7/Sprite2D.texture = load("res://973eaedf89f6405 (3)-1.png-1.png-1.png-3.png-1.png.png")
	$LevelMap/SceneTransition.entering_scene = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
