extends Control

@onready var textbox_container = $Panel/PanelContainer/HBoxContainer
@onready var text_box = $Panel/PanelContainer/HBoxContainer/Text
@onready var name_label = $Panel/PanelContainer/HBoxContainer/Name
@onready var ender = $Panel/PanelContainer/HBoxContainer/Ender
var tween
var running = false
var textqueue = []
signal end_dialog

#func _ready():
	#set_dialog("walter",["lol","thats not nice","Jikes forever!"])

func _process(_delta):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("left_click") ) && running:
		if tween:
			tween.kill()
		text_box.visible_ratio = 1
		stop_it()
	elif (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("left_click")) && !running:
		
		ender.visible = false
		if !textqueue.is_empty():
			write(textqueue[0])
			textqueue.pop_front()
		else :
			$Panel.visible = false
			end_dialog.emit()
		
func enqueue(text_part):
	textqueue.append(text_part)

func write(text):
	text_box.visible_ratio = 0
	text_box.text = text
	if tween:
		tween.kill()
	tween = create_tween()
	running = true
	tween.tween_property(text_box, "visible_ratio", 1, 0.1*text.length())
	tween.tween_callback(stop_it)

func stop_it():
	ender.visible = true
	running = false

func set_dialog(char_name,text_array):
	name_label.text = char_name + ":"
	if char_name == "":
		name_label.text = char_name
	$Panel.visible = true
	for texts in text_array:
		textqueue.append(texts)
	write(textqueue[0])
	textqueue.pop_front()
