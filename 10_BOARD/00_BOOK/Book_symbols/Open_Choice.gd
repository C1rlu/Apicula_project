extends Node

@onready var anwser_panel_choice_root = $"../Anwser_panel_choice_root"

func _ready():
	_global_datas.start_choice.connect(open_choice)	
	
	
func open_choice(condition : bool):
	anwser_panel_choice_root.visible = condition	
