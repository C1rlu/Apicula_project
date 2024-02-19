extends Node

@onready var go_scanner_progress = $"../../Go_scanner_progress"
var t



func _active_scanner_progress(condition):
	
	if !condition:
		if t:
			t.kill()		
		go_scanner_progress.value = 0.0	
		return
	
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(set_progress,0.0,100.0,0.5)	
	t.connect("finished",open_scanner)

func set_progress(value):
	go_scanner_progress.value = value		


func open_scanner():
	_global_datas.show_on_scanner.emit(true)	
	
