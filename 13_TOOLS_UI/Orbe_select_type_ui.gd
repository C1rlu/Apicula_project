extends Control

@onready var orbe_ui = $Panel

func _ready():
	_global_datas._open_orbe_select_ui.connect(open_orbe_ui)
	


func open_orbe_ui(condition : bool):
	orbe_ui.visible = condition
