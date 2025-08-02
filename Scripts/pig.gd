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
		if Globals.holding == "hammer" && !Globals.cards["Diamond"]:
			Ui.set_dialog("",["Hitting it with the hammer smashes it into thousands of pieces.","Within the shards I find the Ace of Diamonds."])
			Globals.cards["Diamond"] = true
			self.queue_free()
