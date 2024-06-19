extends Node3D

@onready var anwser_panel_choice_root = $"."

@export var list_col : Array[CollisionShape3D]
@export var offset : Vector3
func _ready():
	
	for col in list_col:
		col.disabled = true
		
	_global_datas.start_choice.connect(open_choice)		

func open_choice(condition : bool, pos : Vector3):
	anwser_panel_choice_root.visible = condition	
	
	if condition:
		anwser_panel_choice_root.position = pos + offset

