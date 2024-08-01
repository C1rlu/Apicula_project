extends Node

@onready var render_scanner = $"../3D_SCENE/RENDER_Scanner"
@onready var loader = $"../3D_SCENE/Loader"

@onready var scanner_light = $"../3D_SCENE/Scanner_light"

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
			loader.add_child(instance)
	
	#scanner_light.visible = condition
			
func stop_scanner():

	var previous = loader.get_children()
	for e in previous:
		e.queue_free()


