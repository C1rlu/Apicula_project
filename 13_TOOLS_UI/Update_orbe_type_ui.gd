extends Node

@onready var label = $"../Label"
@onready var timer = $Timer

var index : int = 0

func _ready():
	_global_datas._select_orbe_type.connect(_update_ui)
	
func _input(event):
	
	
	if _global_datas.Player_InMirrorScene:
		return
		
	if !_global_datas.Player_InSubScene:
		return
			
	if event.is_action_pressed("Select_next_orbre"):
		switch_orbe_type_data()	
		


func _update_ui(orbe_type : orbe_data):
	
	var orbe_inventory_amount = orbe_type.Orbe_max_amount - orbe_type.Orbe_scene_amount
	label.text = orbe_type.Orbe_kind + " (" + str(orbe_inventory_amount) + " )"
	label.visible = true
	timer.start()
	
func switch_orbe_type_data():
	label.visible = true
	timer.start()
	
	index += 1
	
	if index == _global_datas._orbe_type_list.size():
		index = 0
				
	var orbe_selected_data = _global_datas._orbe_type_list[index]
	select_orbe_type(orbe_selected_data)
	

func select_orbe_type(orbe_type : orbe_data):
	_global_datas._select_orbe_type.emit(orbe_type)
	print(orbe_type.Orbe_kind,"is selected")
	


func _on_timer_timeout():
	label.visible = false
