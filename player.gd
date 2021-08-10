extends KinematicBody

export var _mouse_sensitivy := 0.10
export var _move_speed: float = 3

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	aim(event)


func _physics_process(_delta: float) -> void:
	movement()


func aim(event: InputEvent) -> void:
	var mouse_motion := (event as InputEventMouseMotion)
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivy
		
		var current_tilt: float = $Camera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivy
		
		$Camera.rotation_degrees.x = clamp(current_tilt, -90, 90) 


func movement() -> void:
	var movement := Vector3.ZERO
	var forward_movement := Vector3.ZERO
	var sideways_movement := Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		forward_movement = -transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		forward_movement = transform.basis.z
	
	if Input.is_action_pressed("move_left"):
		sideways_movement += -transform.basis.x
	if Input.is_action_pressed("move_right"):
		sideways_movement += transform.basis.x
	
	movement = forward_movement + sideways_movement
	movement = movement.normalized()
	
	move_and_slide(movement * _move_speed)
