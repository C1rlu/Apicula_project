extends Node


var current_callable : Callable

func _ready():

	_global_datas._add_back_call.connect(add_back_call_and_check)
	_global_datas._clear_back_call.connect(clear)
	_global_datas._execute_back_call.connect(_execute_back_call)
	# need to clear back call if///
	

func _input(event):
	
	#var disable = true
	#if disable:
		#return
	
	if _global_datas.bird_is_waiting:
		return
	if _global_datas.Player_InSubScene:
		return
	if event.is_action_pressed("Back_call"):
		
		var top_call = _global_datas._back_call_list.size()
		#print(top_call)
		if top_call == 0:
			return
		_global_datas._execute_back_call.emit()


func _execute_back_call():
	
	connect_back_call()
	_global_datas._active_back_call.emit()	
	remove_emited_call()	
	
			
func connect_back_call():
	
	var top_call = _global_datas._back_call_list.size()
	current_callable = _global_datas._back_call_list[top_call-1] 
	if !_global_datas._active_back_call.is_connected(current_callable): 
		_global_datas._active_back_call.connect(current_callable)
	

func remove_emited_call():
	
	var top_call = _global_datas._back_call_list.size()
	_global_datas._active_back_call.disconnect(current_callable)
	if top_call == 0:
			return
	_global_datas._back_call_list.remove_at(top_call-1)

func add_back_call_and_check(back_call):
	
	for c in _global_datas._back_call_list:	
		if c == back_call:
			#print("back call exist", c)
			return
			
	_global_datas._back_call_list.append(back_call)		


func clear():
	_global_datas._back_call_list.clear()		
	

