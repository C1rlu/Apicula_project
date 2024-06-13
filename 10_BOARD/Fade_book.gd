extends Node

@onready var book_render = $"../3D_SCENE/BOOK_RENDER"
@onready var material : Material = book_render.get_material()
var f

func _ready():
	_global_datas.book_fade_in.connect(fade_in)
	_global_datas.book_fade_out.connect(fade_out)	
	
func fade_in():
	
	if _global_datas.book_idle_pos:
		return
	if f:
		f.kill()
		
	f = create_tween()
	f.tween_method(change_value,0.0,1.0,0.25)	
	#f.connect("finished",fade_in)
	
func fade_out():
	
	if _global_datas.book_idle_pos:
		return
		
	if f:
		f.kill()
		
	f = create_tween()
	f.tween_method(change_value,1.0,0.0,0.25)	

func change_value(value:float):
	material.set_shader_parameter("Opacity",value)	
