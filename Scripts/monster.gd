extends Area2D

var speed = 10
var interacted = false
@export var dialogname = ""
@export var dialog: Array[String] = [""]

func _on_mouse_entered() -> void:
	Globals.mouseover = self


func _on_mouse_exited() -> void:
	if Globals.mouseover == self:
		Globals.mouseover = null

func _process(delta: float) -> void:
	self.position.y -= speed * delta
	if Input.is_action_just_pressed("left_click") and Globals.mouseover == self:
		if !interacted:
			Ui.set_dialog(dialogname,dialog)
			interacted = true
		elif Globals.all_cards():
			Ui.set_dialog("???",["Oh thank you very much!"])
		else:
			Ui.set_dialog("???",["Have you found them yet?"])
