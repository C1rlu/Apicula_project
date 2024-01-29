extends Node
@onready var root = $".."

@export var burn : ColorRect
@onready var take_object = $"../Take_object"

var t 
var _active

var _is_dragging : bool = false
@export var burn_zone_offset : Vector2

func _ready():
	_global_datas._show_object_legend.connect(_zoom)

func _zoom(condition,value):
	
		_active = condition
	
func _destroy(): 
	
	if _global_datas.Player_InSubScene:
		return
	root.queue_free()
	
func _in_zone():
	
	if _active:
		return
	if _global_datas.Player_InSubScene:
		return
	
	_fade_in()
	take_object.kill_on_pos = true

func _out_zone():

	_fade_out()
	take_object.kill_on_pos = false

func _fade_in():

	if burn:
		burn.visible = true
		
func _fade_out():
	
	if burn:	
		burn.visible = false
	

func _process(delta):
	pass
	return
	#if _is_dragging:
		#_check_burning_position()
		
	
	
func _check_burning_position():
	
	var distance : float
	var bougie_position = _global_datas.bougie_node.position
	var this_position = root.position + burn_zone_offset
	distance = this_position.distance_to(bougie_position)

	if distance < 150.0:
		_in_zone()
	
	else:
		_out_zone()
	
	

