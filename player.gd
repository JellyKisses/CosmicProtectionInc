extends Sprite


onready var timer_rpm
var timer_turn = 0.0
var timer_turn_time = 1.0
var timer_turn_start = 0.0
var dist = 35.0
var firing = false
onready var bullet = preload("res://Bullet.tscn")


#Start Shooting
func fire_start():
	#Execute callback function once to enable single-fire lasers
	_on_PlayerWeaponTimer_timeout()
	firing = true
	
	#Start timer for rapid-fire lasers
	timer_rpm.start()
	pass

#Stop Shooting
func fire_stop():
	firing = false
	#Stop timer for rapid-fire laser
	timer_rpm.stop()
	pass
	
func _ready():
	timer_rpm = get_node("PlayerWeaponTimer")
	
	pass

#Process function for the Player/Weapon
func _process(delta):
	#If weapon has just fired...Start Shooting
	if Input.is_action_just_pressed("player_fire"):
		fire_start()
	#If weapon has just finished firing...Stop Shooting
	elif Input.is_action_just_released("player_fire"):
		fire_stop()
	
	var ang = get_parent().get_local_mouse_position().angle()
	
	if not firing:
		global.cooldown -= delta
	
	global.cooldown = clamp(global.cooldown, 0.0, 1.0)
	
	rotation = ang
	position.x = cos(rotation) * dist
	position.y = sin(rotation) * dist
	
	for node in get_node("Bullets").get_children():
		node.position.x += delta * 500.0 * cos(node.rotation)
		node.position.y += delta * 500.0 * sin(node.rotation)
	
	pass

func _on_PlayerWeaponTimer_timeout():
	timer_rpm.set_wait_time(global.speed)

	if global.cooldown < 1.0:
		var cur = bullet.instance()
		cur.position.x = global_position.x + (cos(global_rotation) * 10.0)
		cur.position.y = global_position.y + (sin(global_rotation) * 10.0)
		cur.rotation = global_rotation + rand_range(-0.05, 0.05)
		get_node("Bullets").add_child(cur)
		get_node("BulletSfx").play()
		global.cooldown += 0.01		
		
	pass
