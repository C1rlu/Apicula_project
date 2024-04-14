extends Node

@export var ini_orbe_list_at_start : Array[Oddity_data]

@export var Follower_data : Oddity_data
@export var Scanner_data : Oddity_data


@onready var keys_type = oddity_enum.Oddity_list.keys()
func _ready():
	
	_global_datas.oddity_in_inventory = ini_orbe_list_at_start
	_global_datas.add_oddity_in_inventory.connect(add_to_list)
	
	#for o in _global_datas.oddity_in_inventory:
		#var my_name = keys_type[o.Oddity_type]
		##print(my_name)
		
# TO REGISTER IN LIST INVENTORY USING TYPE CLASS
func add_to_list(oddity_type : oddity_enum.Oddity_list):

	var type_added = keys_type[oddity_type]
	
	if type_added == "Follower":
		add_to_inventory(Follower_data)
		print(type_added," added")
	if type_added =="Scanner":
		add_to_inventory(Scanner_data)			
		print(type_added," added")
		
func add_to_inventory(oddity_data : Oddity_data):
	_global_datas.oddity_in_inventory.append(oddity_data)	
	
