extends RayCast

var is_mousing_over := false

func _input(_event: InputEvent) -> void:
	var collider_area: Area = self.get_collider() as Area
	
	if collider_area is Food:
		if not is_mousing_over:
			is_mousing_over = true
			GameEvents.emit_signal("food_mouse_over", collider_area)
	elif is_mousing_over:
		is_mousing_over = false
		GameEvents.emit_signal("food_mouse_out")
		print("mouse out")
