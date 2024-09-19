extends GridMap

var cellList = []
var columns_square_root

@onready var visual_cells = $"../VISUAL_CELLS"
var cell_prefabs = preload("res://04_SCENE_MAIN_MAP/Grid/cells_grid_library.tscn")


func _ready():
	pass
	#_create_grid()
	#_global_datas._active_sonar.connect(get_number)
	#_global_datas._load_subscene.connect(_check_sceneIndex)
	#_global_datas._update_info_zone.connect(find_nearest_cell_to_player)
	
func _create_grid():
	var used_cells = get_used_cells()
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	columns_square_root = sqrt(used_cells.size())

	for cell_index in range(used_cells.size()):
		@warning_ignore("integer_division")
		var row_index = cell_index / int(columns_square_root)  # Calculate the row index (0 to 4)
		var col_index = cell_index % int(columns_square_root) # Calculate the column index (0 to 4)
		var cell_name = str(alphabet[row_index]) + str(col_index +1)  # Combine row and column

		var cell_position = Vector3(used_cells[cell_index])
		var cellPos = map_to_local(cell_position)
		var cell_data = {
			 "cell_index": cell_index,
			 "cell_name": cell_name,  # Store the cell index
			 "cell_position": cellPos 
		}
		cellList.append(cell_data)
		_instance_visual_cells(cellPos,cell_name)
		

	#find_nearest_cell_to_player()	

func find_nearest_cell_to_player():
	
	var playerPosition = _global_datas.player_position
	
	var nearest_cell = null
	var nearest_distance = columns_square_root

	for cell_data in cellList:
		var distance = playerPosition.distance_to(cell_data.cell_position)
		
		if distance < nearest_distance:
			nearest_distance = distance
			nearest_cell = cell_data
			_global_datas.subscene_zone_index = nearest_cell.cell_name
			
	#print(_global_datas.subscene_zone_index)


func get_number(_null):
	find_nearest_cell_to_player()
	#_global_datas._show_object_legend.emit(true,_global_datas.subscene_zone_index)			
	
func _check_sceneIndex(_null):
	find_nearest_cell_to_player()
	

func _instance_visual_cells(_position : Vector3, _name : String):
	var new_cell = cell_prefabs.instantiate()
	visual_cells.add_child(new_cell)
	new_cell.transform.origin = _position
	new_cell.get_node_or_null("Grid_name").text = _name 
