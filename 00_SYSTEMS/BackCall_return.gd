extends Node




func _ready():

	_global_datas._add_back_call.connect(add_back_call_and_check)
	_global_datas._clear_back_call.connect(clear)
	# need to clear back call if///
	

func _input(event):
	


	if event.is_action_pressed("Back_call"):
		
		var top_call = _global_datas._back_call_list.size()
		if top_call == 0:
			return
		connect_back_call()
		_global_datas._active_back_call.emit()	
		remove_emited_call()
		
func connect_back_call():
	
	var top_call = _global_datas._back_call_list.size()
	if !_global_datas._active_back_call.is_connected(_global_datas._back_call_list[top_call-1]): 
		_global_datas._active_back_call.connect(_global_datas._back_call_list[top_call-1])
	

func remove_emited_call():
	
	var top_call = _global_datas._back_call_list.size()
	_global_datas._active_back_call.disconnect(_global_datas._back_call_list[top_call-1])
	_global_datas._back_call_list.remove_at(top_call-1)

func add_back_call_and_check(back_call):
	
	for c in _global_datas._back_call_list:	
		if c == back_call:
			print("back call exist", c)
			return
			
	_global_datas._back_call_list.append(back_call)		


func clear():
	#_global_datas._back_call_list.clear()		
	var connections = _global_datas._active_back_call.get_connections()
	print(connections)
