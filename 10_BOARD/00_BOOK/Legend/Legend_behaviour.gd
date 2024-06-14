extends Node

@onready var photo_element_root = $"../.."

@onready var text = $"../legend_render/text"
@onready var text_for_size = $"../legend_render/text_for_size"

@onready var on_over = $"../On_Over"
@onready var timer = $Timer



func _on_photo_element_root_update_legend(legend):
	text.text = legend
	text_for_size.text = legend

	timer.start()

func update_on_onver_size():
	
	var x_2d = text_for_size.size.x

	
	if x_2d > 396:
		on_over.mesh.size.x = x_2d  * 0.0045
	else:
		on_over.mesh.size.x = 1.8


func _on_timer_timeout():
	update_on_onver_size()
