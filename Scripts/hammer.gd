extends Area2D
var speed = 10
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
		Globals.holding = "hammer"
		Ui.set_holder("HAMMER")
		self.visible = false
