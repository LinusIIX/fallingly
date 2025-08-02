extends CanvasLayer

@onready var char_text = $Character_text
@onready var holder_text = $holder/Panel/Label

func set_dialog(char_name,text_array):
	get_tree().paused = true
	char_text.set_dialog(char_name,text_array)


func _on_character_text_end_dialog() -> void:
	get_tree().paused = false

func set_holder(item):
	holder_text.text =("Holding: " + item)
