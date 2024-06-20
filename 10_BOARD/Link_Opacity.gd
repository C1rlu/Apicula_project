extends Node


var t
var current_value : float = 0.0

@onready var card = $"../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/CARD"
@onready var text = $"../3D_SCENE/SubViewport/Camp_root_Render/Camera3D/CARD/Text_render/text"



func _ready():
	_global_datas.responce_link_mode.connect(link_mode)
	

func link_mode(condition : bool, _text : String):
				
	card.visible = condition	
	text.text = _text	
	_global_datas.question_node.visible = !condition
			
	if t:
		t.kill()
	
	if condition:	
		t = create_tween()
		t.tween_method(change_value,current_value,1.0,0.5)
		_global_datas._add_back_call.emit(_leave_link_mode)
	else:
		t = create_tween()
		t.tween_method(change_value,current_value,0.0,0.5)	

	_global_datas.show_ui_scanner_dots.emit(condition)
	
func _leave_link_mode():
	link_mode(false,"null")	

		
func change_value(value : float):
	RenderingServer.global_shader_parameter_set("link_opacity", value)
	current_value = value
