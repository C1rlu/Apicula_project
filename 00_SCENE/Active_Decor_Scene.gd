extends Node
@onready var decor = $"../--DECOR--"

@export var viewports : Array [SubViewport]
@onready var active_scene_viewports = $"../01_GAME_UI/MAIN_SCENE_UI/Active_scene_viewports"

func _ready():
	_global_datas.show_3D_MainScene.connect(_hide_decor)
	
func _hide_decor(condition : bool):
	decor.visible = condition	
	active_scene_viewports._active_viewports(condition)
