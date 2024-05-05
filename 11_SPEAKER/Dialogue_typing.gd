extends Node

@onready var dialogue_text : Label = $"../../00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_text"

var t

signal text_type_done
var _is_typing : bool = false
var active



func _ready():
	_global_datas._type_text.connect(type_text)
	_global_datas._hide_dialogue_box.connect(stop_typing)
	_global_datas._show_dialogue_box.connect(go_typing)
	
func stop_typing():
	active = false

func go_typing():
	
	active = true
	var words = dialogue_text.text.length()
	type_text(words)
	
	
func type_text(count : int):
	
	dialogue_text.visible_ratio = 0.0
	var speed = 0.05 * count
	#var clamp_speed = clamp(1.0,2.0,speed)
	#print( speed," for ", count ," letter")
	_is_typing = true
	if t:
		t.kill()
	t = create_tween()
	
	t .tween_method(change_ration,0.0,1.0,speed)
	t.connect("finished",on_tween_finished)

func on_tween_finished():
	_is_typing = false
	if active:
		text_type_done.emit()	
	
func change_ration(value : float):
	dialogue_text.visible_ratio = value
	

func _input(event):
	
	if !active:
		return
	if _is_typing:
		if event.is_action_pressed("Back_call"):
			if t:
				t.kill()	
			dialogue_text.visible_ratio = 1.0
			text_type_done.emit()
