extends Node

@export var position_spots : Array[Node3D]
const PositionsClass = preload("res://08_SUBSCENES/01_Main_Oddity/Positions_class/Positions_class.gd")

func _ready():
	
	for p in position_spots:
		var position_data = PositionsClass.new() 
		position_data.Position = p
		position_data.is_used = false
		
		_global_datas.Main_oddity_positions_data.append(position_data)
		
	#for p_data in position_spots_data:	
		#print(p_data.Position)
		#print(p_data.is_used)
