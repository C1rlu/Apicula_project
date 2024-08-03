extends Node


@onready var render_ = $"../Control/Render"
@onready var render_material : Material = render_.get_material()

var fade_in
func _ready():
	_global_datas.set_tool_ui.connect(fade)
	render_.visible = false	
func fade(data):
	render_.visible = true
	
	if fade_in:
		fade_in.kill()
	
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,1.0,0.0,2.0).set_trans(Tween.TRANS_SINE)
	fade_in.connect("finished",done)
	
func done():
	render_.visible = false

func set_shader_value(value):
	render_material.set_shader_parameter("Opacity",value)
