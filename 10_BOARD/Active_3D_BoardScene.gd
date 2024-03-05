extends Node
@onready var Scene = $"../3D_SCENE"

func _ready():
	_global_datas.show_3D_BoardScene.connect(_hide_decor)
	_global_datas.show_3D_BoardScene.emit(false)
func _hide_decor(condition : bool):
	Scene.visible = condition	

