extends Node



@onready var cam_raycast = $Viewport/CAM_RAYCAST
@onready var load_scene = $LoadScene
@onready var mouse_raycast = $MOUSE_RAYCAST

func _ready():
	
	_global_datas._go_Subscene.connect(_loadscene)
	_global_datas._go_Subscene.connect(active_subscene)
	_global_datas._go_Mainscene.connect(disable_subscene)
	_global_datas.cell_name = "null"
	cam_raycast.current = false
	mouse_raycast.set_collision_layer(0)
	
func _loadscene():
	
	#REMOVE PREVIOUS SCENE
	for child in load_scene.get_children():
		child.free()
	
	#LOAD NEW SCENE
	var scene_name =  _global_datas.cell_name
	var constant_string = "res://08_SUBSCENES/Grid_scene/" + scene_name + ".tscn"
	
	# Check if the scene exists before loading
	if ResourceLoader.exists(constant_string):
		var scene_instance = load(constant_string)
		if scene_instance:
			var instance_scene = scene_instance.instantiate()
			$LoadScene.add_child(instance_scene )	
					
	else:	
		print("Scene does not exist: " + scene_name)
		var constant_string_null = "res://08_SUBSCENES/Grid_scene/A2.tscn"
		var scene_instance = load(constant_string_null)
		var instance_scene = scene_instance.instantiate()
		$LoadScene.add_child(instance_scene )
		
		
func active_subscene():

	_global_datas.Player_InSubScene = true
	_global_datas._start_ini_subscene.emit()
	_global_datas._splash.emit()

	cam_raycast.current = true
	mouse_raycast.set_collision_layer(4) 
func disable_subscene():
	_global_datas.Player_InSubScene = false
	cam_raycast.current = false
	mouse_raycast.set_collision_layer(0) 

	
	

