extends Node

@onready var _show_ui = $"../Center"
@onready var h_box_container = $"../Center/HBoxContainer"

var button_list : Array[Button]
var select_index : int = 0
@onready var timer = $Timer


signal _fade(condition : bool)
var is_active : bool = false

func _ready():
	_global_datas.open_tool_selector.connect(show_ui)
	_global_datas._backFrom_subscene.connect(hide)

func _input(event):
	
	if  !_global_datas.Player_InSubScene:
		return
	
	
	if event.is_action_pressed("Select_next_orbre"):	
		select_next_index()
		
	if event.is_action_pressed("Select_previous_orbre"):	
		select_previous_index()	
		
func hide():
	show_ui(false)	
	is_active = false

func show_ui(condition : bool):
	
	update_button_list()
	
	if condition:
		_show_ui.visible = true
	
	_fade.emit(condition)

func select_next_index():

		
	timer.start()
	if !is_active:
		_global_datas.open_tool_selector.emit(true)
		
		button_list[select_index].grab_focus()
		is_active = true
		return
	
	select_index += 1
	
	if select_index == button_list.size():
		select_index = 0


	var selected_button = button_list[select_index]
	selected_button.grab_focus()
	selected_button.button_down.emit()
	
func select_previous_index():
	
	timer.start()

	
	if !is_active:
		_global_datas.open_tool_selector.emit(true)
		button_list[select_index].grab_focus()
		is_active = true
		return
	
	select_index -= 1
	
	if select_index == -1:
		select_index = button_list.size()-1

		
	var selected_button = button_list[select_index]
	selected_button.grab_focus()
	selected_button.button_down.emit()

func update_button_list():

	button_list.clear()
	var all_b = h_box_container.get_children()	
	
	for b in all_b:
		if b.visible:
			button_list.append(b)	



func _on_timer_timeout():
	hide()
