extends Area2D


func _on_Area2D_area_entered(area):
	if area.get_parent().has_meta("role"):
		get_node("ExpSfx").play()
		if area.get_parent().frame == 0:
			area.get_parent().frame = 1
			area.get_parent().modulate.r = 1.0
			area.get_parent().modulate.g = 0.3
			area.get_parent().modulate.b = 0.3
		else:
			area.get_parent().play()
			
			match area.get_parent().get_meta("role"):
				1:
					global.score += 50
				2:
					global.score += 100
				3:				
					global.score += 10
					if global.hits > 0:
						global.hits -= 1
				4:
					global.score += 10
					if global.speed > 0.01:
						global.speed -= 0.01
		
	pass
