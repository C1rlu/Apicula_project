extends Node

@export var legend_data : Symbols_legend_data
var selected_index : int = 0

@onready var text = $"../Text_render/text"
@onready var text_for_size = $"../Text_render/text_for_size"


func _ready():
	_update_legend()
	
func _select_next_legend():
	selected_index +=1
	
	
func _update_legend():	
	
	if selected_index > legend_data.legends.size()-1:
		selected_index = 0  
		
	var selected_legend = legend_data.legends[selected_index] 	
	text.text = selected_legend
	text_for_size.text = selected_legend


func _on_next_legend_active_next_legend():
	_select_next_legend()
	_update_legend()
