extends Control

export(NodePath) onready var _dialog_text = get_node(_dialog_text) as Label
export(NodePath) onready var _avatar = get_node(_avatar) as TextureRect
export(Resource) var _current_dialogue = _current_dialogue as Dialogue 

var _current_slice_index := 0

func _ready() -> void:
	show_slide()
	_avatar.texture = _current_dialogue.avatar_texture


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("advanced_slice"):
		if _current_slice_index < _current_dialogue.dialog_slides.size() - 1:
			_current_slice_index += 1
			show_slide()
		else:
			self.visible = false


func show_slide() -> void:
	_dialog_text.text = _current_dialogue.dialog_slides[_current_slice_index]
	pass
