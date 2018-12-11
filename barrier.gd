extends Sprite

func _ready():
	global.hits = 0
	pass

func _process(delta):
	global_rotation = 0.0
	modulate.r = 1.0
	modulate.g = 1.0 - (global.hits / 25.0) - (get_node("Timer").time_left * 4.0)
	modulate.b = 1.0 - (global.hits / 25.0) - (get_node("Timer").time_left * 4.0)
	get_node("Hits").text = "%d/25" % (25 - global.hits)
	pass