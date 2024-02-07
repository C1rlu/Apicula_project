extends Node

@onready var dialogue_text : Label = $"../../00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_text"


var t

signal text_type_done
var _is_typing : bool = false

func _ready():
	_global_datas._type_text.connect(type_text)
	
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
	await create_tween().tween_interval(speed).finished
	text_type_done.emit()
	_is_typing = false
	
func change_ration(value : float):
	dialogue_text.visible_ratio = value
	

func _input(event):
	
	if _is_typing:
		if event.is_action_pressed("Click"):
			if t:
				t.kill()	
			dialogue_text.visible_ratio = 1.0
			text_type_done.emit()