extends Node

#@onready var anwser_panel_choice_root = $"../Anwser_panel_choice_root"

@export var _position : Vector3
@export var _rotation : Vector3

func _ready():
	pass
	#_global_datas.start_choice.connect(open_choice)	
	
	
func open_choice(condition : bool):
	pass
	#anwser_panel_choice_root.visible = condition	
	#anwser_panel_choice_root.position = _position	
	#anwser_panel_choice_root.rotation_degrees = _rotation
