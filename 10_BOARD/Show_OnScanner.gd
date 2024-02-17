extends Node

@onready var render_scanner = $"../RENDER_Scanner"
@onready var loader = $"../InsidePhoto_scanner_scene/loader"
@onready var backdrop_focus = $"../BACKDROP_FOCUS"

func _ready():
	_global_datas.show_on_scanner.connect(_show_scanner)
	_global_datas.show_board_description.connect(stop_scanner)
	render_scanner.visible = true
	backdrop_focus.visible = true
	stop_scanner(false,"")
func _show_scanner(photoData : PhotoData):
	
	if photoData.scanner_prefab == null:
		return
		
	var instance = photoData.scanner_prefab.instantiate()
	loader.add_child(instance)
	
	
func stop_scanner(condition : bool,text : String):
	
	
	_global_datas.in_scanner_mode = condition
	
	if !condition:
		var previous = loader.get_children()
		for e in previous:
			e.queue_free()
