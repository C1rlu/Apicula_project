extends Node

@onready var teleporter_prefab = $".."

var t

func player_in(condition):
	
	if condition:
		
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(_value,1.0,1.15,0.15).set_trans(Tween.TRANS_SINE)

	else:
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(_value,1.15,1.0,0.15).set_trans(Tween.TRANS_SINE)
		
func _value(value : float):
	teleporter_prefab.scale = Vector3(value,value,value)
	
func _on_active_effect_on_area_player_in(condition):
	player_in(condition)
