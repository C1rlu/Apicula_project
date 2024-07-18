extends Node


@export var main_render_msh : Node3D
@export var main_render_msh_mirror : Node3D
@export var State_selected : game_state.visible_state

@export var Vfx : GPUParticles3D



func _ready():
	_global_datas.in_mirror_zone.connect(check_player_in_mirror)
	check_player_in_mirror()

func check_player_in_mirror():
	
		if State_selected == _global_datas.player_state:
			show(true)
		else:
			show(false)		
	

func show(condition):
	
	if main_render_msh:
		main_render_msh.visible = condition
	if main_render_msh_mirror:	
		main_render_msh_mirror.visible = !condition

	if Vfx:
		Vfx.emitting = condition

			
func _on_switch_mirror_switch_mirror():
	
	if State_selected == game_state.visible_state.mirror:
		State_selected = game_state.visible_state.normal
		check_player_in_mirror()
		return
		
	if State_selected == game_state.visible_state.normal:
		State_selected = game_state.visible_state.mirror
		check_player_in_mirror()
		return
