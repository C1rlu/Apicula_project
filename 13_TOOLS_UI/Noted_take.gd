extends Node


@onready var book_img = $"../book_img"
@onready var material : Material = book_img.get_material()

var t


func _ready():
	_global_datas.ui_noted_taked.connect(noted)

func noted():
	
	book_img.visible = true
	if t:
		t.kill()
	t = create_tween()
	t .tween_method(set_shader_value,1.0,0.0,3.0)
func set_shader_value(value):
	
	material.set_shader_parameter("Opacity",value)
