extends Node

@export var oddity_in_inventory_data : Oddity_list_data
@onready var keys_type = oddity_enum.Oddity_list.keys()


func _ready():
	
	_global_datas.oddity_in_inventory = oddity_in_inventory_data
	_global_datas.add_oddity_in_inventory.connect(add_to_list)
	

		
# TO REGISTER IN LIST INVENTORY USING TYPE CLASS
func add_to_list(oddity_type : oddity_enum.Oddity_list):

	var type_added = keys_type[oddity_type]
	
	if type_added == "Follower":
		oddity_in_inventory_data.Number_of_followers += 1
		print(oddity_in_inventory_data.Number_of_followers," added")
	if type_added =="Scanner":
		oddity_in_inventory_data.Number_of_scanner += 1	
		print(oddity_in_inventory_data.Number_of_scanner," added")
		
