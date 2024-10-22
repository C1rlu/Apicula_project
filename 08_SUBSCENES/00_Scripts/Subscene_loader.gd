extends Node
@onready var load_scene = $LoadScene
var _load : bool = false
var constant_scene

func _ready():
	
	_global_datas._load_subscene.connect(_loadscene)
	_global_datas._go_Subscene.connect(active_subscene)
	_global_datas._backFrom_subscene.connect(disable_subscene)
	_global_datas.LoadScene = load_scene
	
func _loadscene(condition : bool):
	
	if !condition:
			
		#REMOVE PREVIOUS SCENE ONLY
		for child in load_scene.get_children():
			child.queue_free()	
	else :
		#REMOVE PREVIOUS SCENE EVERYLOAD
		for child in load_scene.get_children():
			child.queue_free()	
			
	#LOAD NEW SCENE
		constant_scene = get_scene()
		if ResourceLoader.exists(constant_scene):
			ResourceLoader.load_threaded_request(constant_scene)
			
	#to load in process	
	_load = condition	
	$load_sublevel.visible = condition

func get_scene():
	return _global_datas.zoneData.zone_packed_scene.get_path()
	
func get_path_from_scene_index():
	var path = "res://08_SUBSCENES/00_Scene/" + _global_datas.subscene_zone_index +".tscn"
	return path
		
func active_subscene():
	_global_datas._clear_back_call.emit()
	_global_datas.Player_InSubScene = true
	_global_datas._start_ini_subscene.emit()
	
	_global_datas.current_scene_state = game_state.scene_state._Subscene
	_global_datas._show_object_legend.emit(false,"null")
	
func disable_subscene():
	_global_datas.Player_InSubScene = false
	_global_datas.current_scene_state = game_state.scene_state._Main
	
func instance_loaded_scene():
	
	_global_datas._photo_data_scene_list.clear()
	
	var scene_loaded = ResourceLoader.load_threaded_get(constant_scene)
	var instance_scene = scene_loaded.instantiate()
	$LoadScene.add_child(instance_scene)	
	_load = false
	
func _process(delta):
	
	if !_load:
		return
	var progress = []
	ResourceLoader.load_threaded_get_status(constant_scene, progress)	
	$load_sublevel.value = progress[0]*100
	
	if progress[0] == 1:
		instance_loaded_scene()
		
