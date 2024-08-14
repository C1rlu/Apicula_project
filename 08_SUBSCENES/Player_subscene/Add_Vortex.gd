extends Node


@export var vortex_tool : tool_data
const TELEPORTER_PREFAB = preload("res://08_SUBSCENES/Oddity/Teleporter/Teleporter_prefab.tscn")
@onready var vortex_creation_part : GPUParticles3D = $"../Vortex_creation_part"
@onready var vortex_creation_msh = $"../Vortex_creation_msh"

var t
@onready var area = $"../ZoneCollide"
@onready var timer_check = $Timer_check
var active : bool

func _ready():
	vortex_tool.tool_active_signal.connect(add_vortex)
	_global_datas.in_mirror_zone.connect(check_mirror)	
	
	
func check_mirror():

	var player_state = _global_datas.player_state
					 
	if player_state == game_state.visible_state.normal:
		vortex_tool.disable_button = false
	if player_state == game_state.visible_state.mirror:
		vortex_tool.disable_button = true
	
	
func add_vortex(condition : bool):
	
	if vortex_tool.disable_button:
		return
	
	if condition:
		vortex_creation_part.emitting = true
		vortex_creation_msh.visible = true
		
		
		if t:
			t.kill()
		t = create_tween()
		
		t.tween_method(_value,0.0,1.0,1.0)
		t.connect("finished",set_vortex)
		
	else:
		if t:
			t.kill()
		vortex_creation_part.emitting = false
		
		timer_check.stop()	
		vortex_creation_msh.visible = false
func set_vortex():
	
	if check_zone(): #check is a zone is overlapping return true
		#print("A ZONE IS OVERLAPPING PLS SET VORTEX ELSEWHERE")
		timer_check.start()
		return
	
	var teleporter = TELEPORTER_PREFAB.instantiate()
	_global_datas.LoadScene.add_child(teleporter)
	var player_position = _global_datas.subbscene_playerPosition
	teleporter.global_position = player_position
	timer_check.stop()	
	vortex_creation_msh.visible = false
	
	disable()
	
func disable():

	vortex_tool.disable_button = true
	vortex_creation_part.emitting = false
	
func _value(value : float):
	vortex_creation_part.amount_ratio = value	
	vortex_creation_msh.scale = Vector3(value,value,value)

func check_zone() -> bool :
	
	var areas = area.get_overlapping_areas()
	for a in areas:
		var vortex_limit = a.get_node_or_null("vortex_limit")	
		if vortex_limit:
			return true
	return false



func _on_timer_check_timeout():
	set_vortex()	
