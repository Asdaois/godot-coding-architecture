# class_name
extends KinematicBody

export var _mouse_sensitivy := 0.10

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	var mouse_motion := (event as InputEventMouseMotion)
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivy
		
		var current_tilt: float = $Camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivy
		
		$Camera.rotation_degrees.x = clamp(current_tilt, -90, 90) 

