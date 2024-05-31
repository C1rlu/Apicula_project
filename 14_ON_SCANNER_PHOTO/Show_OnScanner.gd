extends Node

@onready var render_scanner = $"../RENDER_Scanner"
@onready var loader = $"../InsidePhoto_scanner_scene/loader"
@onready var backdrop_focus = $"../BACKDROP_FOCUS"
@onready var active_scene_viewports = $"../Active_scene_viewports"

func _ready():
	_global_datas.show_on_scanner.connect(_show_scanner)

	render_scanner.visible = true
	backdrop_focus.visible = true
	stop_scanner()
	
func _show_scanner(condition : bool):
	
	_global_datas.in_scanner_mode = condition
	
	active_scene_viewports._active_viewports(condition)
	
	if condition:
		
		#loader.rotation = Vector3.ZERO
		stop_scanner()
		if !_global_datas.selected_photoData:
			return
		if _global_datas.selected_photoData.scanner_prefab:	
			var instance = _global_datas.selected_photoData.scanner_prefab.instantiate()
			loader.add_child(instance)
		_global_datas.show_ui_scanner_dots.emit(true)
		_global_datas._add_back_call.emit(_back_call)
		
		if _global_datas.Npc_Dialogue != null:
			_global_datas._start_dialogue_box.emit()
		
		
func stop_scanner():

	var previous = loader.get_children()
	for e in previous:
		e.queue_free()


func _back_call():
	
	_global_datas.show_on_scanner.emit(false)
	_global_datas._show_object_legend.emit(false,"")
	_global_datas.show_ui_scanner_dots.emit(false)
	
	#_global_datas._start_dialogue_box.emit()
	if _global_datas.Npc_Dialogue != null:
		_global_datas._show_dialogue_box.emit()
	