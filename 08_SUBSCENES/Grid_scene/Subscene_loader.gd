extends Node



@onready var cam_raycast = $CAM_RAYCAST

func _ready():
	
	_global_datas._go_Subscene.connect(_loadscene)
	_global_datas._go_Subscene.connect(active_subscene)
	_global_datas._go_Mainscene.connect(disable_subscene)
	_global_datas.cell_name = "null"
	cam_raycast.current = false
	
func _loadscene():	
	#REMOVE PREVIOUS SCENE
	for child in $LoadScene.get_children():
		child.free()
	
	#LOAD NEW SCENE
	var scene_name =  _global_datas.cell_name
	var constant_string = "res://08_SUBSCENES/Grid_scene/" + scene_name + ".tscn"
	var scene_resource = load(constant_string)
	if scene_resource == null:
		print("scene " + scene_name + " doesn't exist")
		return
	var instance_scene = scene_resource.instantiate()
	$LoadScene.add_child(instance_scene)
	
	
func active_subscene():	

	_global_datas.Player_InSubScene = true
	_global_datas._start_ini_subscene.emit()
	_global_datas._splash.emit()

	cam_raycast.current = true

func disable_subscene():
	_global_datas.Player_InSubScene = false
	cam_raycast.current = false

	
	

