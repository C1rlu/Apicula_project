extends Node

var photo_data : PhotoData
@export var close_to_eyes_value : float = 0.7
@onready var is_select = $"../IS_SELECT"


var legend

var _is_select : bool = false

func _ready():
	photo_data =  $"..".photo_data
	legend = get_node_or_null("Legend")
	
func show_legend(condition : bool):
	
	if condition:
		var legend_text = photo_data.legend
		_global_datas.show_board_description.emit(true,legend_text)
	else:
		_global_datas.show_board_description.emit(false,"")	

	
				
func _on_input_event(camera, event, _position, normal, shape_idx):

	if !_global_datas.Player_In_Inventory:
		return
	
	if event.is_action_pressed("Click"):
		
		_global_datas.Inventory_board_Object_isSelect = true
		show_legend(true)		
		_is_select = true	
		is_select.visible = true	
		
func _input(event):
	
	if _is_select:
		if event.is_action_pressed("Click"):		
			show_legend(false)
			is_select.visible = false





