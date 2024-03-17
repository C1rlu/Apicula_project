extends Node

@onready var Panel_ui = $"../Panel_ui"
@onready var timer = $Timer

var index : int = 0

func _ready():
	_global_datas._show_orbe_ui.connect(_update_ui)
	_global_datas._open_menu.connect(close_orbe_ui)
	
	
func _input(event):
	
	if _global_datas.Player_InMirrorScene:
		return
		
	if !_global_datas.Player_InSubScene:
		return
			
	if event.is_action_pressed("Select_next_orbre"):
		switch_orbe_type_data(1)	
		
	if event.is_action_pressed("Select_previous_orbre"):
		switch_orbe_type_data(-1)	
		
func _update_ui():
	
	var orbe_type = _global_datas._orbe_type_list[index]
	Panel_ui.visible = true
	timer.start()
	
	update_icon_select_color(orbe_type)
	
	
func switch_orbe_type_data(value):

	index += value
	
	if index == _global_datas._orbe_type_list.size():
		index = 0
	
	if index == -1:
		index = _global_datas._orbe_type_list.size()-1
				
	var orbe_selected_data = _global_datas._orbe_type_list[index]
	select_orbe_type(orbe_selected_data)
	

func select_orbe_type(orbe_type : orbe_data):
	_global_datas._select_orbe_type.emit(orbe_type)

	_update_ui()



func update_icon_select_color(orbe_type : orbe_data):
	
	for o in _global_datas._orbe_type_list:
		o.select_ui_icon.emit(false)
		
	orbe_type.select_ui_icon.emit(true)		
	
func close_orbe_ui(condition : bool):
	if condition:
		Panel_ui.visible = false		
	
func _on_timer_timeout():
	Panel_ui.visible = false
