extends Node


var element_count : int

func _ready():
	_global_datas._check_object.connect(_check_object)
	
	
	
func _check_object():
	
	_global_datas._check_objectZone_col.disabled = false
	
	var utility = GameUtility.new()
	var n_timer = utility.create_timer(0.05,_check,self)
	n_timer.start()

	
func _check():
	
	element_count = 0
	var all_areas = _global_datas._check_objectZone_Area.get_overlapping_areas()
	
	for area in all_areas:
		var element = area.get_node_or_null("Element")
		if element:
			element_count += 1
			print(element.element.element_name)
			
	if element_count > 1:
		print("PLS SEND ONLY ONE ELEMENT")
		#_global_datas._show_object_legend.emit(true,"I CAN SENT ONLY ONE ELEMENT")
	
	if element_count == 0:
		print("Put an elemen to send")	
		
	if element_count ==1:
		_global_datas._open_player_map.emit(true)
		
	_global_datas._check_objectZone_col.disabled = true
