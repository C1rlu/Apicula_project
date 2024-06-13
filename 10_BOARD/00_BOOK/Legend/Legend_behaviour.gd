extends Node

@onready var photo_element_root = $"../.."

@onready var text = $"../legend_render/text"
@onready var text_for_size = $"../legend_render/text_for_size"

func _on_photo_element_root_update_legend(legend):
	text.text = legend
	text_for_size.text = legend
