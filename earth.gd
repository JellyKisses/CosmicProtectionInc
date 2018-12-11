extends Sprite

func updateScore():
	get_node("../../UI/Score").text = "Score: %d" % global.score
	pass

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	updateScore()
	
	pass

func _exit_tree():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass
	
func _process(delta):
	updateScore()
	rotate(delta / 16.0)
	pass
