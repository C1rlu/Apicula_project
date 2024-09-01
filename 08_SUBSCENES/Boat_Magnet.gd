extends Node


@export var area_magnet : Area3D

var magneting : bool = false
var list_of_magnetable : Array[Node]

func _ready():
	#area_magnet.area_entered.connect(_magnet_enter)
	#area_magnet.area_exited.connect(_magnet_exited)
	pass#
		
func _process(delta):
	
	if !magneting:
		return
	
	for m in list_of_magnetable:
		m.attract_me(delta,area_magnet.global_position)
	
	
			
func _magnet_enter(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		
		if magnetable:
			list_of_magnetable.append(magnetable)
			
		if list_of_magnetable.size() > 1:
			magneting = true		 
func _magnet_exited(area):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			list_of_magnetable.erase(magnetable)
		
		if list_of_magnetable.size() == 0:
			magneting = false
