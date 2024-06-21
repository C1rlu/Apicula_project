extends Node


@onready var responce = $"../../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/CARD/Text_responce/ColorRect/responce"


var t

func change_responce(responce_text : String):
	
	responce.text = responce_text
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(change_ratio,0.0,1.0,0.5)
	
	
func change_ratio(value : float):

	responce.visible_ratio = value	


func _on_link_opacity_type_responce(_text):
	change_responce(_text)
