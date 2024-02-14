extends Node

var photo_data : PhotoData
@export var close_to_eyes_value : float = 0.7
@onready var is_select = $"../IS_SELECT"

@onready var photo_area = $".."


var _is_select : bool = false

func _ready():
	photo_data =  $"..".photo_data
	_global_datas.open_inventory.connect(close_inventory)
	
func show_legend(condition : bool):
	
	if condition:
		var legend_text = photo_data.legend
		_global_datas.show_board_description.emit(true,legend_text)
		var focus_pos = photo_area.global_position
		_global_datas.focus_this_on_board.emit(focus_pos)
		_is_select = true	
		is_select.visible = true	
	else:
		_global_datas.show_board_description.emit(false,"")	

	
				
func _on_input_event(camera, event, _position, normal, shape_idx):

	if !_global_datas.Player_In_Inventory:
		return
	
	if _is_select:
		return
	if event.is_action_pressed("Click"):
		
	
		show_legend(true)		
	
		
func _input(event):
	
	if _is_select:
		if event.is_action_pressed("Click"):		
			show_legend(false)
			is_select.visible = false
			_is_select = false


func close_inventory(condition : bool):
	if !condition:
		is_select.visible = false
