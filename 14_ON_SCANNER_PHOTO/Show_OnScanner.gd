extends Node

@onready var render_scanner = $"../3D_SCENE/RENDER_Scanner"
@export var scanner_first_data : PhotoData



func _ready():
	_global_datas.show_on_scanner.connect(_show_scanner)

	render_scanner.visible = true

	stop_scanner()
	_global_datas.selected_photoData = scanner_first_data
	

func _show_scanner(condition : bool):
	
	if condition:
		#loader.rotation = Vector3.ZERO
		stop_scanner()
		if !_global_datas.selected_photoData:
			return
		if _global_datas.selected_photoData.scanner_prefab:	
			var instance = _global_datas.selected_photoData.scanner_prefab.instantiate()
			_global_datas.scanner_root.add_child(instance)
	
	#if condition:
		#RenderingServer.global_shader_parameter_set("isGray", 1.0)
	#else:
		#RenderingServer.global_shader_parameter_set("isGray", 0.0)	
			
func stop_scanner():
	
	if _global_datas.scanner_root:
		var previous = _global_datas.scanner_root.get_children()
		for e in previous:
			e.queue_free()


