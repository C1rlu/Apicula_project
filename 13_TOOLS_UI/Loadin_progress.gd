extends Node

@onready var progress_bar = $"../ProgressBar"

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
		progress_bar.value = 0.0
		
func go_subscene():
	_global_datas._active_progress_subscene.emit(false)
	_global_datas._go_Subscene.emit()			
		
		
func _value(value : float):
	
	progress_bar.value = value
