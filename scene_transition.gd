extends CanvasLayer
@onready var leaving_scene = false
@onready var entering_scene = false
@onready var load_scene = ""

func change_scene(scene):
	load_scene = scene
	leaving_scene = true

func _process(delta: float) -> void:
	if entering_scene:
		$ColorRect.position.x += 1200*delta
		if $ColorRect.position.x > 432:
			entering_scene = false
			$ColorRect.position.x = -432
	elif leaving_scene:
		$ColorRect.position.x += 1200*delta
		if $ColorRect.position.x > 0:
			$ColorRect.position.x == 0
			leaving_scene = false
			get_tree().change_scene_to_file(load_scene)
			
