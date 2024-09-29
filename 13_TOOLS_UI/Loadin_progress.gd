extends Node


var t 
func _ready():
	
	_global_datas._active_progress_subscene.connect(_load)
	
func _load(condition : bool):
	
	if condition:
		
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(_value,0.0,100.0,1)
		t.connect("finished",go_subscene)
	
	else:
		if t:
			t.kill()
		_global_datas.subscene_progress_bar.value = 0.0
		
func go_subscene():
	_global_datas._active_progress_subscene.emit(false)
	_global_datas._go_Subscene.emit()			
	_global_datas._add_back_call.emit(back_call)	
	_global_datas.Player_InMenu = true
func back_call():
	_global_datas._go_Mainscene.emit()
	_global_datas._backFrom_subscene.emit()
	_global_datas.Player_InMenu = false	
func _value(value : float):
	
	_global_datas.subscene_progress_bar.value = value

