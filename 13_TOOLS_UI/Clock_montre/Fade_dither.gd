extends Node


@export var tool_clock : tool_data


@export var texture_img : TextureRect
@export var fade_timing_in : float = 0.5
@export var fade_timing_out : float = 0.5
@onready var material : Material = texture_img.get_material()

var t
var actual_value : float


func _ready():
	material.set_shader_parameter("Opacity",0.0)
	_global_datas._go_Subscene.connect(fade_out)
	tool_clock.tool_active_signal.connect(tool_active)
	
	

func tool_active(condition : bool):
	
	if condition:
		fade_in()
	else:
		fade_out()
		
		
func fade_in():
	
	var tree  = get_tree()
	if tree == null:
		return
	
	
	if t:
		t.kill()
	t = create_tween()
	t .tween_method(_set_opacity_value,actual_value,1.0,fade_timing_in)
	
func fade_out():

	var tree  = get_tree()
	if tree == null:
		return
		
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_set_opacity_value,actual_value,0.0,fade_timing_out)
		
func _set_opacity_value( value : float):

	material.set_shader_parameter("Opacity",value)	
	actual_value = value
	
