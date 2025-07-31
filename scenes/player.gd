extends Area2D


func _on_mouse_entered() -> void:
	Globals.mouseover = self


func _on_mouse_exited() -> void:
	if Globals.mouseover == self:
		Globals.mouseover = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and Globals.mouseover == self:
		Ui.set_dialog("wow",["wow","wowow"])
