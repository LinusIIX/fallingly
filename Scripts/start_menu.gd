extends Control
@onready var gamescene = "res://Scenes/main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.main = self


func _on_button_pressed() -> void:
	#Globals.main.change_scene_to(gamescene)
	#Globals.main.add_child(gamescene.instantiate())
	self.visible = false
