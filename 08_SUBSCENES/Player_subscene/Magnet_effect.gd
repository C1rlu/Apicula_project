
extends Node

@export var manget_tool : tool_data
@export var magnet_fx : GPUParticles3D
@export var Magnet_Area : Area3D
@onready var collider = $"../Magnet_zone/CollisionShape3D"

@onready var root = $".."
var magneting : bool = false
var list_of_magnetable : Array[Node]


func _ready():
	manget_tool.tool_active_signal.connect(_active)
	
	Magnet_Area.area_entered.connect(_magnet_enter)
	Magnet_Area.area_exited.connect( _magnet_exited)
func _active(condition : bool):

	magnet_fx.emitting = condition
	magneting = condition
	collider.disabled = !condition
	#if !condition:
		#list_of_magnetable.clear()
		#_subscene_datas._element_in_magnet.clear()
	
func _process(delta):
	
	if !magneting:
		return	
			
	for m in list_of_magnetable:
		m.attract_me(delta,root.global_position)
			
func _magnet_enter(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")

		if magnetable:
			list_of_magnetable.append(magnetable)
			_subscene_datas._update_player_weight.emit(list_of_magnetable.size())
		
func _magnet_exited(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			list_of_magnetable.erase(magnetable)
			_subscene_datas._update_player_weight.emit(list_of_magnetable.size())
	
