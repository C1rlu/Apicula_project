extends Node
@onready var decor = $"../--DECOR--"

func _ready():
	_global_datas.show_3D_MainScene.connect(_hide_decor)
	
func _hide_decor(condition : bool):
	decor.visible = condition	
	print("SHOW MAIN DECOR__", condition)
