
extends Node

@export var manget_tool : tool_data
@export var manget_remove_tool : tool_data
@export var magnet_fx : GPUParticles3D
@export var Magnet_Area : Area3D

@onready var timer_on = $Timer_on

func _ready():
	manget_tool.tool_active_signal.connect(active_check)
	manget_remove_tool.tool_active_signal.connect(active_off)
	timer_on.timeout.connect(check_for_debris)

func active_check(condition : bool):
	
	if condition:
		check_for_debris()
		timer_on.start()
	else:
		timer_on.stop()	
		
	#magnet_fx.emitting = condition

func active_off(condition : bool):
	
	if condition:
		_remove_debris()

			
func check_for_debris():
	
	var all_areas = Magnet_Area.get_overlapping_areas()

	for area in all_areas:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			if !check_if_on_list(magnetable):						
				magnetable._attract(true)
				_subscene_datas.list_of_magnetable.append(magnetable)
				break
				
	_subscene_datas._update_player_weight.emit(_subscene_datas.list_of_magnetable.size())
	#print(_subscene_datas.list_of_magnetable.size())
				
	#var Utility = GameUtility.new()				
	#var closest_element = Utility.get_closest_element(Magnet_Area.position,all_close_element)	
	
			
func _remove_debris():
	
	if _subscene_datas.list_of_magnetable.size() == 0:
		return
	var last_one = _subscene_datas.list_of_magnetable[_subscene_datas.list_of_magnetable.size()-1]
	last_one._attract(false)
	_subscene_datas.list_of_magnetable.erase(last_one)	
	#print(_subscene_datas.list_of_magnetable.size())
	_subscene_datas._update_player_weight.emit(_subscene_datas.list_of_magnetable.size())
	
func check_if_on_list(element)-> bool:
	
	for e in _subscene_datas.list_of_magnetable:
		if e == element:
			return true
	return false		
	
	
