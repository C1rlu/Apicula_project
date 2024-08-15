extends Node


@onready var oxygene_miss_effet = $"../Oxygene_miss_effet"
@onready var oxygene_miss_effet_mat : Material = oxygene_miss_effet.get_material()

@onready var effect_test = $"../Oxy_vaine_effect"


var fade_out

func _ready():
	pass
	#_global_datas.in_mirror_zone.connect(_active)
func _input(event):
	
	
	if event.is_action_pressed("debug_3"):
		#effect_test._fade_out(1.0)
		takePhoto(1.0)
		
func _active():
	takePhoto(0.5)	
	
	
func takePhoto(fade_timer : float):

	await get_tree().create_timer(0.1).timeout
	var capture = get_viewport().get_texture().get_image() 
	var texture = ImageTexture.create_from_image(capture)
	oxygene_miss_effet.texture = texture
	
	if fade_out:
		fade_out.kill()
	fade_out = create_tween()
	fade_out.tween_method(set_value,1.0,0.0,fade_timer)
	
func set_value(value : float):
	oxygene_miss_effet_mat.set_shader_parameter("Opacity",value )	

	
