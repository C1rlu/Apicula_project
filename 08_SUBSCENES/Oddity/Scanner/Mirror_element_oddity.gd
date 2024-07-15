extends Node

@onready var col = $"../Main_Oddity/col"
@onready var col_rg = $"../Col_rg"
@onready var main_render_msh = $"../Main_Oddity/Render_root/Main_render_msh"
@onready var main_render_msh_mirror = $"../Main_Oddity/Render_root/Main_render_msh_mirror"


var in_mirror : bool = true
var is_outside_mirror : bool = false
func _ready():
	_global_datas.in_mirror_zone.connect(out_of_mirror)
	out_of_mirror(false)

func out_of_mirror(condition):

	main_render_msh.visible = condition
	main_render_msh_mirror.visible = condition

	col.disabled = !condition
	col_rg.disabled = !condition
	
func _on_switch_mirror_switch_mirror():
	in_mirror = !in_mirror
	out_of_mirror(in_mirror)
