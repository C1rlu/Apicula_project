extends Node

@onready var responce = $"../Text_responce/ColorRect/responce"
@onready var n_text = $"../Text_render/text"
@onready var render_responce = $"../Render_responce"

var t
func _on_letter_area_responce_link(text):
	change_responce(text)

	
func change_responce(responce_text : String):
	
	render_responce.visible = true
	responce.text = responce_text
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(change_ratio,0.0,1.0,0.5)
	
	
func change_ratio(value : float):

	responce.visible_ratio = value	
