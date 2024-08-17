extends Node

@export var move_node : Node3D
@export var position_over : Vector3 = Vector3(0.002,0.01,0.01)
@export var rotation_over : Vector3 = Vector3.ZERO

var move_node_position : Vector3


func _ready():
	

	if move_node:
		move_node_position = move_node.global_position
	
func on_over(condition):
	
	if move_node:
		move(condition)
	
		
func move(condition : bool):
	
	
	if condition:
		move_node.global_position = move_node_position + position_over
	else:
		move_node.global_position  = move_node_position	
	
		
func _on_on_click_on_position(Position):
	move_node_position = Position
