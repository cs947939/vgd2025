extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func play_sfx():
	self.pitch_scale = 1+(randf()*2-1)*0.1
	self.play()
