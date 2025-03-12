extends CanvasLayer
@onready var leaving_scene = false
@onready var entering_scene = false
@onready var load_scene = ""

func change_scene(scene):
	load_scene = scene
	leaving_scene = true

func _process(delta: float) -> void:
	if entering_scene:
		$ColorRect.x += 100*delta
		if $ColorRect.x > 432:
			$ColorRect.x == -432
			entering_scene = false
	elif leaving_scene:
		$ColorRect.x += 100*delta
		if $ColorRect.x > 0:
			$ColorRect.x == 0
			leaving_scene = false
			get_tree().change_scene_to_file(load_scene)
			
