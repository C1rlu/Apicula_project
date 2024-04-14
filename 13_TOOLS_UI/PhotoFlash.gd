extends Node

@onready var photo_flash_2f_fx = $Photo_Flash_2F_FX
@onready var material : Material = photo_flash_2f_fx.get_material()

var t
func _ready():
	
	_global_datas.ui_photo_flash.connect(photo_flash)


func photo_flash():

	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(_value,1.0,0.0,0.75)
	
	
func _value(value):
	
	material.set_shader_parameter("Opacity",value)	
