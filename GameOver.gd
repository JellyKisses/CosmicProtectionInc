extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if visible and event.is_pressed():
		get_tree().reload_current_scene()
		get_tree().paused = false
		