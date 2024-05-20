extends Node
@onready var root = $".."

@export var orber_tool : tool_data 
@export var symbols_array : Array[Symbols_data]
var zone_active : bool 

@onready var render_symbols = $"../Render_symbols"

@onready var render_symbols_mat : Material = render_symbols.get_surface_override_material(0)
var symbols_index : int 

func _ready():
	
	orber_tool.tool_active_signal.connect(next_symbol)	
	
func next_symbol(condition):
	
	if condition:
		if _global_datas._traceur_pause:
			next_symbols()	
		
			
func next_symbols():
	symbols_index +=1
	
	if	symbols_index >= symbols_array.size():
		symbols_index = 0		
		
	render_symbols_mat.set_shader_parameter("Symbols",symbols_array[symbols_index].symbols_img)
	#print(symbols_array[symbols_index])
	
func _on_ini_et_s_active_symbols():
	var selected_orbe = symbols_array[symbols_index].orbe_type
	_global_datas.instance_orbe_result.emit(selected_orbe,root.global_position)
