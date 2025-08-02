extends Area2D
var speed = 15
@export var dialogname = ""
@export var dialog: Array[String] = [""]
var interacted = false

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
		if !interacted:
			interacted = true
			Ui.set_dialog(dialogname,dialog)
		else:
			Ui.set_dialog("Skull",["Have you seen my crown around?"])
		if Globals.holding == "crown" && !Globals.cards["Spade"]:
			$Skull.frame = 1
			Ui.set_dialog("Skull",["He He He","Thank you so much!","Here you go..."])
			Ui.set_dialog("",["The skull opens it jaw reveling the Ace of Spades"])
			Globals.cards["Spade"] = true
			self.queue_free()
