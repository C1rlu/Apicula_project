extends Node

@onready var photo_flash = $"../../PHOTO_FLASH"

func _ready():
	_global_datas._give_photo.connect(_start_flash)
	
	
	
func _start_flash(element):
	
	var t
	t = create_tween()
	t.tween_method(_value,1.0,0.0,1.0)
	
	
func _value(value : float):
	
	photo_flash.get_material().set_shader_parameter("Opacity",value)	
