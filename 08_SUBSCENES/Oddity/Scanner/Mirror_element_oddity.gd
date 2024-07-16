extends Node

@onready var col = $"../Main_Oddity/col"
@onready var col_rg = $"../Col_rg"
@onready var main_render_msh = $"../Main_Oddity/Render_root/Main_render_msh"
@onready var main_render_msh_mirror = $"../Main_Oddity/Render_root/Main_render_msh_mirror"


@export var State_selected : _global_datas.scene_visible_state = _global_datas.scene_visible_state.mirror


func _ready():
	_global_datas.in_mirror_zone.connect(player_in_mirror)
	show(false)

func player_in_mirror(condition):
	
	if condition:
		if State_selected == _global_datas.scene_visible_state.mirror:
			show(true)
		if State_selected == _global_datas.scene_visible_state.normal:
			show(false)	
	else:
		if State_selected == _global_datas.scene_visible_state.mirror:
			show(false)
		if State_selected == _global_datas.scene_visible_state.normal:
			show(true)
	

func show(condition):
	main_render_msh.visible = condition
	main_render_msh_mirror.visible = condition

	col.disabled = !condition
	col_rg.disabled = !condition
	

			
func _on_switch_mirror_switch_mirror():
	
	if State_selected == _global_datas.scene_visible_state.mirror:
		State_selected = _global_datas.scene_visible_state.normal
		show(false)	
		return
		
	if State_selected == _global_datas.scene_visible_state.normal:
		State_selected = _global_datas.scene_visible_state.mirror
		show(false)		
		return
