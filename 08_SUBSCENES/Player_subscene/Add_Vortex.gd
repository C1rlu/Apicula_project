extends Node


@export var vortex_tool : tool_data
const TELEPORTER_PREFAB = preload("res://08_SUBSCENES/Oddity/Teleporter/Teleporter_prefab.tscn")
@onready var vortex_creation_part : GPUParticles3D = $"../Vortex_creation_part"

var t


func _ready():
	vortex_tool.tool_active_signal.connect(add_vortex)
	
func add_vortex(condition : bool):
	
	if condition:
		vortex_creation_part.emitting = true
		if t:
			t.kill()
		t = create_tween()
		
		t.tween_method(_value,0.0,1.0,1.0)
		t.connect("finished",set_vortex)
		
	else:
		if t:
			t.kill()
		vortex_creation_part.emitting = false
			
		
func set_vortex():
	
	var teleporter = TELEPORTER_PREFAB.instantiate()
	_global_datas.LoadScene.add_child(teleporter)
	var player_position = _global_datas.subbscene_playerPosition
	teleporter.global_position = player_position
	
	disable()
	
func disable():
	vortex_tool.selector_button.visible = false
	_global_datas.update_selector.emit()
	vortex_creation_part.emitting = false
func _value(value : float):
	vortex_creation_part.amount_ratio = value	

