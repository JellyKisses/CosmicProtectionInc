extends Node

onready var moon = preload("res://Moon.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	for node in get_node("Container").get_children():
		node.dist -= delta * 15.0
		if node.dist <= 75:
			global.hits += 1
			get_node("Container").remove_child(node)
			get_parent().get_node("Barrier/Timer").start()
			get_node("ExpSfx").play()
			
	if global.hits > 25:
		get_parent().get_parent().get_parent().get_node("UI/GameOver").visible = true
		get_tree().paused = true
	pass

func _on_SpawnTimer_timeout():
	if get_node("Container").get_child_count() < 128:
			
		var cur = moon.instance()
		cur.modulate.r = clamp(global.cooldown, 0.0, 1.0)
		cur.modulate.g = clamp(1.0 - global.cooldown, 0.0, 1.0)
		cur.modulate.b = 0.0
		cur.dist = randi() % 300 + 100
		cur.angle = rand_range(0.0, 360.0)
		cur.parPos = get_parent().global_position
		var num = randi() % 16
		if num == 1:
			cur.set_meta("role", 2)
		elif num == 2:
			cur.set_meta("role", 3)
		elif num == 3:
			cur.set_meta("role", 4)
		else:
			cur.set_meta("role", 1)
		get_node("Container").add_child(cur)
	
	pass
