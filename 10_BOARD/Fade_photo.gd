extends Node

@onready var _render = $"../3D_SCENE/PHOTO"
@onready var material : Material = _render .get_material()
var f
var current_value : float

func _ready():
	
	_global_datas.photo_fade_in.connect(fade_in)
	_global_datas.photo_fade_out.connect(fade_out)	
	
func fade_in():
	

	
	if f:
		f.kill()
		
	f = create_tween()
	f.tween_method(change_value,0.0,1.0,0.25)	
	#f.connect("finished",fade_in)
	
func fade_out():


	if f:
		f.kill()
		
	f = create_tween()
	f.tween_method(change_value,1.0,0.0,0.25)	

func change_value(value:float):
	material.set_shader_parameter("Opacity",value)	
	current_value = value
