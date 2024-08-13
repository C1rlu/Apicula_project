extends Node

@onready var _show_ui = $"../Center"
@onready var h_box_container = $"../Center"

var button_list : Array[Button]
var select_index : int = 0

signal _fade(condition : bool)
var is_active : bool = false

var lock_selector : bool = false
func _ready():
	_global_datas.open_tool_selector.connect(show_ui)
	_global_datas._backFrom_subscene.connect(hide)
	_global_datas.update_selector.connect(update_button_list_after_removed)
	_global_datas.open_tool_selector.connect(_lock_selector)
	
func _lock_selector(condition : bool):

	lock_selector = condition
				
#func _input(event):
	#
	#if  !_global_datas.Player_InSubScene:
		#return
	#
	#if _global_datas.Player_InDialogue:
		#return
		#
		#
	#if !lock_selector:
		#return
		#
	#if event.is_action_pressed("move_right"):	
		#select_next_index()
		#
	#if event.is_action_pressed("move_left"):	
		#select_previous_index()	
		#

			
func hide():
	show_ui(false)	
	is_active = false
	lock_selector = false
	
	
func show_ui(condition : bool):
	
	update_button_list()
	
	if condition:
		_show_ui.visible = true
		button_list[select_index].grab_focus()
		get_tree().paused = true
	else:
		get_tree().paused = false
	_fade.emit(condition)
	
func select_next_index():
	
	#timer.start()
	#if !is_active:
		#button_list[select_index].grab_focus()
		#is_active = true
		#return
	
	select_index += 1
	
	if select_index == button_list.size():
		select_index = 0


	var selected_button = button_list[select_index]
	selected_button.grab_focus()

	
func select_previous_index():
	

	
	select_index -= 1
	
	if select_index == -1:
		select_index = button_list.size()-1

		
	var selected_button = button_list[select_index]
	selected_button.grab_focus()


func update_button_list():


	
	button_list.clear()
	var all_b = h_box_container.get_children()	
	
	for b in all_b:
		if b.visible:
			button_list.append(b)	

func update_button_list_after_removed():

	button_list.clear()
	var all_b = h_box_container.get_children()	
	
	for b in all_b:
		if b.visible:
			button_list.append(b)	
			
	select_index = button_list.size()-1
	var selected_button = button_list[select_index]
	selected_button.grab_focus()
	selected_button.button_down.emit()


