extends Node
@onready var oxygene_miss_effet = $"../Oxygene_miss_effet"
@onready var oxygene_miss_effet_mat : Material = oxygene_miss_effet.get_material()


var fade_out

func _input(event):
	
	
	if event.is_action_pressed("debug_3"):
		takePhoto()

func takePhoto():

	await get_tree().create_timer(0.1).timeout

	var capture = get_viewport().get_texture().get_image() 
	
	var texture = ImageTexture.create_from_image(capture)

	
	oxygene_miss_effet.texture = texture


	if fade_out:
		fade_out.kill()
	
	fade_out = create_tween()
	
	fade_out.tween_method(set_value,1.0,0.0,2.0)
	
func set_value(value : float):
	oxygene_miss_effet_mat.set_shader_parameter("Opacity",value )	
	var lerp_value = lerp(0.0,0.05,value)
	RenderingServer.global_shader_parameter_set("mirror_wave_speed", lerp_value)	


