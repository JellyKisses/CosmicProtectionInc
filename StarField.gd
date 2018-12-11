extends Sprite

var curFrame = 0
var elapsed = 0.0
var frame1 = preload("res://star-1.png")
var frame2 = preload("res://star-2.png")
var frames = [frame1, frame2]

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	elapsed += delta
	
	region_rect.position.x += delta * 25.0
	region_rect.position.y += delta * 25.0
	scale.x = sin(elapsed / 2.0) / 2.0 + 2.0
	scale.y = sin(elapsed / 4.0) / 2.0 + 2.0
	modulate.r = 0.5 + 0.5 * cos(elapsed + 0.0)
	modulate.g = 0.5 + 0.5 * cos(elapsed + 2.0)
	modulate.b = 0.5 + 0.5 * cos(elapsed + 4.0)
	pass

func _on_Timer_timeout():
	curFrame = (curFrame + 1) % 2
	texture = frames[curFrame]
	pass
