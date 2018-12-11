extends Sprite


func _on_TimerLife_timeout():
	get_parent().remove_child(self)
	pass # replace with function body
