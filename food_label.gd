extends Label

func _ready() -> void:
	GameEvents.connect("food_mouse_over", self, "_on_food_hover")
	GameEvents.connect("food_mouse_out", self, "_on_food_out")
	self.hide()

func _on_food_hover(food: Food) -> void:
	self.text = food.food_name
	self.show()

func _on_food_out() -> void:
	self.hide()
