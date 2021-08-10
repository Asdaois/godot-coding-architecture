extends Spatial

export(Resource) var _dialogue = _dialogue as Dialogue


func _on_DialogTrigger_body_entered(_body: Node) -> void:
	GameEvents.emit_signal("dialog_initiated", _dialogue)

