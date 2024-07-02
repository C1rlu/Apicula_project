extends Node
@onready var epave_zone = $".."

@onready var on_over = $"../Boue_msh_01/On_Over"


signal _contact(condition : bool)

func get_dive_data():
	return epave_zone.boue_data	

func On_Over(condition : bool):
	on_over.visible = condition	
