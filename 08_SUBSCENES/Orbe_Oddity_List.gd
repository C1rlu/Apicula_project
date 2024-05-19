extends Node


@export var Oddity_inventory_base : Oddity_inventory
@export var followers : Oddity_data
@export var scanner : Oddity_data
@onready var keys_type = oddity_enum.Oddity_list.keys()

func _ready():
	pass

# TO REGISTER IN LIST INVENTORY
func add_to_list(oddity : Oddity_data):
	
	var type_added = keys_type[oddity.Oddity_type]
	print(type_added, " add to inventory")
	
	
	if oddity == followers:
		Oddity_inventory_base.amount_of_follower +=1
		
	if oddity == scanner:
		Oddity_inventory_base.amount_of_X_SCANNER +=1	
				
func remove_from_list(oddity : Oddity_data):
	
	if oddity == followers:
		Oddity_inventory_base.amount_of_follower -=1
		
	if oddity == scanner:
		Oddity_inventory_base.amount_of_X_SCANNER -=1	
		
	var type_added = keys_type[oddity.Oddity_type]
	print(type_added, " removed from inventory")
	
