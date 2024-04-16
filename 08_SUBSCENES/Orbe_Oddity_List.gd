extends Node

@onready var keys_type = oddity_enum.Oddity_list.keys()

func _ready():
	
	_global_datas.add_oddity_to_inventory.connect(add_to_list)
	_global_datas.remove_oddity_to_inventory.connect(remove_from_list)
		
# TO REGISTER IN LIST INVENTORY
func add_to_list(oddity : Oddity_data):
	
	_global_datas.oddity_list.append(oddity)
	var type_added = keys_type[oddity.Oddity_type]
	print(type_added, "add to inventory")

func remove_from_list(oddity : Oddity_data):
	
	_global_datas.oddity_list.erase(oddity)
	var type_added = keys_type[oddity.Oddity_type]
	print(type_added, "removed from inventory")
