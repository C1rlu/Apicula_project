extends Node

@onready var anwser_panel_choice_root = $"../Anwser_panel_choice_root"

@export var right_position : Vector3
@export var right_rotation : Vector3
@export var left_position : Vector3
@export var left_rotation : Vector3

func _ready():
	_global_datas.start_choice.connect(open_choice)	
	
	
func open_choice(condition : bool, side_index : int):
	anwser_panel_choice_root.visible = condition	
	
	if side_index == 0:
		anwser_panel_choice_root.position = right_position	
		anwser_panel_choice_root.rotation_degrees = right_rotation
		
	if side_index == 1:
		anwser_panel_choice_root.position = left_position	
		anwser_panel_choice_root.rotation_degrees = left_rotation
