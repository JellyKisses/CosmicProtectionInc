extends Label

func _input(event):
	if visible and event.is_pressed():
		get_tree().reload_current_scene()
		get_tree().paused = false	
