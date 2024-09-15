
extends Node
@onready var root = $".."
@export var manget_tool : tool_data
@export var manget_remove_tool : tool_data
@export var magnet_fx : GPUParticles3D
@export var collector_collider : CollisionShape3D
@export var Magnet_Area : Area3D

@onready var timer_on = $Timer_on
var magneting : bool = false

func _ready():
	manget_tool.tool_active_signal.connect(_active)
	Magnet_Area.area_entered.connect(_magnet_enter)
	Magnet_Area.area_exited.connect(_magnet_exited)
func _active(condition : bool):

	magnet_fx.emitting = condition
	magneting = condition
	collector_collider.disabled = !condition
	

func _process(delta):
	
	if !magneting:
		return
		
	for m in _subscene_datas.list_of_magnetable:
		m._attract(delta,root.global_position)
	
	
			
func _magnet_enter(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")

		if magnetable:
			_subscene_datas.list_of_magnetable.append(magnetable)
			
	
func _magnet_exited(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			_subscene_datas.list_of_magnetable.erase(magnetable)
			
	
#_subscene_datas._update_player_weight.emit(_subscene_datas.list_of_magnetable.size())

	
func _remove_debris():
	
	if _subscene_datas.list_of_magnetable.size() == 0:
		return
	var last_one = _subscene_datas.list_of_magnetable[_subscene_datas.list_of_magnetable.size()-1]
	last_one._attract(false)
	_subscene_datas.list_of_magnetable.erase(last_one)	

	_subscene_datas._update_player_weight.emit(_subscene_datas.list_of_magnetable.size())
