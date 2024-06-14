extends Node
@onready var responce_text = $"../Text"


var t


func update_text(responce):


	responce_text.text = responce
	var words = responce_text.text.length()
	responce_text.visible_ratio = 0.0
	var speed = 0.025 * words

	if t:
		t.kill()
	t = create_tween()
	
	t .tween_method(change_ration,0.0,1.0,speed)

func _on_responce_area_type_text(responce):
	update_text(responce)


func change_ration(value : float):
	responce_text .visible_ratio = value
	
