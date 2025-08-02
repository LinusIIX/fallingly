extends Area2D
var speed = 15
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
		Globals.holding = "pan"
		Ui.set_holder("PAN")
		self.visible = false
		
	if Globals.holding != "pan":
		self.visible = true
	
	if self.position.y < -10:
		self.position.y += 100
		$Pan.rotation += randf_range(-10.0, 10.0)
