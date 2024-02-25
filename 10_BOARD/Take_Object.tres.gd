extends Node

var photo_data : PhotoData
@export var close_to_eyes_value : float = 0.7
@onready var is_select = $"../IS_SELECT"

@onready var photo_area = $".."

var can_be_scanne = true
var _is_select : bool = false

signal on_click(condition : bool)

func _ready():
	photo_data =  $"..".photo_data
	_global_datas.open_inventory.connect(close_inventory)
	
func show_legend(condition : bool):
	
	if condition:
		var legend_text = photo_data.legend

		_global_datas._show_object_legend.emit(true,legend_text)
		var focus_pos = photo_area.global_position
		_global_datas.focus_this_on_board.emit(focus_pos)
		_is_select = true	
		is_select.visible = true
		_global_datas.selected_photoData = photo_data

	else:
		_global_datas._show_object_legend.emit(false,"")	
		is_select.visible = false
		_is_select = false		
		
func close_inventory(condition : bool):
	if !condition:
		is_select.visible = false


func _on_on_click(condition):
	
	if condition:
		_global_datas.show_on_scanner.emit(true)
		
	else:
		_global_datas.show_on_scanner.emit(false)
