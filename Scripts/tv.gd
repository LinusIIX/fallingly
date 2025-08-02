extends Area2D
var speed = 8
@export var dialogname = ""
@export var dialog: Array[String] = [""]

func _ready() -> void:
	$AnimationPlayer.play("idle")

func _on_mouse_entered() -> void:
	Globals.mouseover = self

func _on_mouse_exited() -> void:
	if Globals.mouseover == self:
		Globals.mouseover = null

func _process(delta: float) -> void:
	self.position.y -= speed * delta
	if Input.is_action_just_pressed("left_click") and Globals.mouseover == self:
		Ui.set_dialog(dialogname,dialog)
		if Globals.holding == "cassete" && !Globals.cards["Club"]:
			$AnimationPlayer.play("on")
			Ui.set_dialog("",["The Ace of Hearts slides out of the slot."])
			Globals.cards["Heart"] = true
