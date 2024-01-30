extends Node

@onready var dialogue_text : Label = $"../../00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_text"

var t

signal text_type_done

func type_text():
	
	dialogue_text.visible_ratio = 0.0
	
	if t:
		t.kill()
	t = create_tween()
	
	t .tween_method(change_ration,0.0,1.0,1.0)
	await create_tween().tween_interval(1.0).finished
	text_type_done.emit()
	
func change_ration(value : float):
	dialogue_text.visible_ratio = value


func _on_dialogue_box_type_text():
	type_text()
