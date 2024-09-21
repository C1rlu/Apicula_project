extends Node

@onready var main_light = $"../--DECOR--/Player_Boat/Main_light"
@onready var main = $"../01_GAME_UI/MAIN_SCENE_UI/Viewports/MAIN"
@onready var main_mat : Material = main.get_material()
func _ready():
	_global_datas._set_night.connect(_night)
	_global_datas._set_day.connect(_day)

func _night():
	
	main_light.omni_range = 6.0
	main_mat.set_shader_parameter("Night",0.3)
func _day():
	
	main_light.omni_range = 7.0
	main_mat.set_shader_parameter("Night",0.0)
