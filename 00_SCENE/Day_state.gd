extends Node

@onready var main_light = $"../--DECOR--/Player_Boat/Main_light"
@onready var main = $"../01_GAME_UI/MAIN_SCENE_UI/Viewports/MAIN"
@onready var main_mat : Material = main.get_material()
func _ready():
	_global_datas._set_night.connect(_night)
	_global_datas._set_day.connect(_day)

func _night():
	RenderingServer.global_shader_parameter_set("Night", 0.8)
	main_light.omni_range = 6.0

func _day():
	RenderingServer.global_shader_parameter_set("Night", 0.0 )
	main_light.omni_range = 7.0

