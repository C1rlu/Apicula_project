extends Node




func _ready():
	
	_global_datas._back_call.connect(remove_emited_call)
	_global_datas._add_back_call.connect(add_back_call_and_check)

func _input(event):
	
	var top_call = _global_datas._back_call_list.size()
	if top_call == 0:
		return
	
	if event.is_action_pressed("Back_call"):
		_Play_last_back_call()
		_global_datas._back_call.emit()	
		
		
func _Play_last_back_call():
	
	var top_call = _global_datas._back_call_list.size()
	print(top_call)
	_global_datas._back_call.connect(_global_datas._back_call_list[top_call-1])
	

func remove_emited_call():
	
	var top_call = _global_datas._back_call_list.size()
	_global_datas._back_call.disconnect(_global_datas._back_call_list[top_call-1])
	_global_datas._back_call_list.remove_at(top_call-1)

func add_back_call_and_check(back_call):
	
	for c in _global_datas._back_call_list:	
		if c == back_call:
			return
			
	_global_datas._back_call_list.append(back_call)		
