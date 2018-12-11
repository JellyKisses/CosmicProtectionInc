extends AnimatedSprite

var parPos = Vector2()
var angle = 0.0
var dist = 100.0
var vel = 100.0

func _ready():
	match get_meta("role"):
		1:
			frame = 1
			modulate.r = 1.0
			modulate.g = 0.3
			modulate.b = 0.3
		2:
			frame = 0
			modulate.r = 1.0
			modulate.g = 1.0
			modulate.b = 1.0
		3:
			frame = 1
			modulate.r = 0.3
			modulate.g = 1.0
			modulate.b = 0.3
		4:
			frame = 1
			modulate.r = 0.3
			modulate.g = 0.3
			modulate.b = 1.0
	pass

func _process(delta):
	vel = 35000 / dist
	angle = fmod(angle + (delta * vel), 360.0)
	
	var r = deg2rad(angle)
	global_position.x = cos(r) * dist - sin(r) * dist + parPos.x
	global_position.y = sin(r) * dist + cos(r) * dist + parPos.y
	global_rotation = parPos.angle_to_point(global_position)
	pass

func _on_Moon_animation_finished():
	get_parent().remove_child(self)
	pass
