extends Node


@onready var camera_3d = $"../../SubViewport_scanner/Camp_root_Render/Camera3D"

var t

func _ready():
	
	_global_datas.show_on_scanner.connect(back_from_scanner)
		
func _process(delta):
	
	#var disable = true
	#if disable:
		#return

	if !_global_datas.in_scanner_mode:
		return
	
	
	if Input.is_action_pressed("Board_zoom_in"):
		var _magnitude = Input.get_action_strength("Board_zoom_in")
		camera_3d.fov -= _magnitude * 50 * delta

	if Input.is_action_pressed("Board_zoom_out"):
		var _magnitude = Input.get_action_strength("Board_zoom_out")
		camera_3d.fov += _magnitude* 50* delta

	camera_3d.fov = clampf(camera_3d.fov,10.0,40)

	
	
func back_from_scanner(condition : bool):
	
	
	var actual_fov = camera_3d.fov
	if condition:
		return

	if t:
		t.kill()
				
	t = create_tween()
	t.tween_method(change_fov,actual_fov,40,0.5)
	
func zoom_in_scanner():
	change_fov(30)
	
func change_fov(value : float):
	camera_3d.fov = value	

