extends Node

@onready var col = $"../Main_Oddity/col"
@onready var col_rg = $"../Col_rg"
@onready var main_render_msh = $"../Main_Oddity/Render_root/Main_render_msh"
@onready var main_render_msh_mirror = $"../Main_Oddity/Render_root/Main_render_msh_mirror"


@export var State_selected : game_state.visible_state


func _ready():
	_global_datas.in_mirror_zone.connect(check_player_in_mirror)
	show(false)

func check_player_in_mirror():
	
		if State_selected == _global_datas.player_state:
			show(true)
		else:
			show(false)		
	

func show(condition):
	main_render_msh.visible = condition
	main_render_msh_mirror.visible = !condition

	#col.disabled = !condition
	col_rg.disabled = !condition
	

			
func _on_switch_mirror_switch_mirror():
	
	if State_selected == game_state.visible_state.mirror:
		State_selected = game_state.visible_state.normal
		check_player_in_mirror()
		return
		
	if State_selected == game_state.visible_state.normal:
		State_selected = game_state.visible_state.mirror
		check_player_in_mirror()
		return
