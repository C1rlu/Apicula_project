extends Node

@onready var teleporter_prefab = $".."


@onready var explose_part = $"../Explose_part"
var t

signal check_teleporter

func scale_effect():
	
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_value,1.0,0.25,0.15).set_trans(Tween.TRANS_SINE)
	t.connect("finished",back_sacle)

func back_sacle():
	
	check_teleporter.emit()
	
	if t:
		t.kill()
		t = create_tween()
		t.tween_method(_value,0.25,1.0,0.5).set_trans(Tween.TRANS_SINE)
		
func _value(value : float):
	teleporter_prefab.scale = Vector3(value,value,value)
	



func _on_teleporter_timer_teleport_effect():
	explose_part.emitting = true	
	scale_effect()
