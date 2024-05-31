extends Node


@onready var text_for_size = $"../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/Assign_render/Text_render/text_for_size"
@onready var text = $"../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/Assign_render/Text_render/text"

@onready var assign_render = $"../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/Assign_render"


func _ready():
	_global_datas.legend_active.connect(active_legend_assign)
	
	
func active_legend_assign(condition : bool, legend : String):
	_global_datas.in_legend_assign_mode = condition	
	
	assign_render.visible = condition
	if condition:
		text_for_size.text = legend
		text.text = legend
	
#func _process(delta):
	#
	#if !_global_datas.in_legend_assign_mode:
		#return
			
