@tool
extends Control

@export var line_color : Color
@export var inner_radius : int = 64
@export var line_width : float = 1.0


func _draw():

	draw_arc(Vector2.ZERO,inner_radius,0,TAU,128,line_color,line_width,false)
	
func _process(delta):
	queue_redraw()
