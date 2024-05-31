extends Node

@export var legend_data : Symbols_legend_data
var selected_index : int = 0

@onready var text = $"../Text_render/text"
@onready var text_for_size = $"../Text_render/text_for_size"

@onready var legend_prefab = $".."
@onready var collision_shape_3d = $"../Next_Zone/CollisionShape3D"


func _ready():
	disable_at_start()
	

func disable_at_start():
	legend_prefab.visible = false	
	collision_shape_3d.disabled = true
		
func _update_legend():	
	
	
	if selected_index > legend_data.legends.size()-1:
		selected_index = 0  
		
	var selected_legend = legend_data.legends[_global_datas.legend_page_index] 	
	text.text = selected_legend
	text_for_size.text = selected_legend

	if !legend_prefab.visible:
		legend_prefab.visible = true
		collision_shape_3d.disabled = false	

	
	
func _on_legend_prefab_update_legend():
	_update_legend()
