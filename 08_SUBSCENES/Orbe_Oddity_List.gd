extends Node

@export var ini_orbe_list_at_start : Array[Oddity_data]
@export var All_Oddity : Array[Oddity_data]

func _ready():
	
	_global_datas.oddity_in_inventory = ini_orbe_list_at_start
	_global_datas.add_oddity_in_inventory.connect(add_to_list)
	
	for o in _global_datas.oddity_in_inventory:
		var oddity_name = str(o.Oddity_type)
		print(oddity_name)

# TO REGISTER IN LIST INVENTORY USING TYPE CLASS
func add_to_list(oddity_type : oddity_enum.Oddity_list):

	for o in All_Oddity:
		if o.Oddity_type == oddity_type:
			var oddity_name = str(o.Oddity_type)
			
			_global_datas.oddity_in_inventory.append(o)
			print(oddity_name)
