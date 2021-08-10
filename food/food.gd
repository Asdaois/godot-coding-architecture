extends Area
class_name Food

export(String) var food_name

func _ready() -> void:
	$SpotLight.hide()
	GameEvents.connect("food_mouse_over", self, "_on_mouse_entered")
	GameEvents.connect("food_mouse_out", self, "_on_mouse_out")

func _on_mouse_entered(food: Food) -> void:
	if food == self:
		$SpotLight.show()


func _on_mouse_out() -> void:
	$SpotLight.hide()
	pass
