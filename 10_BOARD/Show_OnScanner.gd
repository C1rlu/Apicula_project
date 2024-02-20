extends Node

@onready var render_scanner = $"../RENDER_Scanner"
@onready var loader = $"../InsidePhoto_scanner_scene/loader"
@onready var backdrop_focus = $"../BACKDROP_FOCUS"

func _ready():
	_global_datas.show_on_scanner.connect(_show_scanner)
	render_scanner.visible = true
	backdrop_focus.visible = true
	stop_scanner()
	
func _show_scanner(condition : bool):
	
	_global_datas.in_scanner_mode = condition
	if condition:
		stop_scanner()
		if !_global_datas.selected_photoData:
			return
		if _global_datas.selected_photoData.scanner_prefab:	
			var instance = _global_datas.selected_photoData.scanner_prefab.instantiate()
			loader.add_child(instance)
		_global_datas._add_back_call.emit(_back_call)
	
func stop_scanner():

	var previous = loader.get_children()
	for e in previous:
		e.queue_free()


func _back_call():
	_global_datas.show_on_scanner.emit(false)	