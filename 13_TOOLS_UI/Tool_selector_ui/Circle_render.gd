@tool
extends Control

@export var color : Color
@export var line_color : Color

@export var outer_radius : int = 256
@export var inner_radius : int = 64
@export var line_width : float = 1.0


func _draw():
	#draw_circle(Vector2.ZERO,outer_radius,color)
	draw_arc(Vector2.ZERO,inner_radius,0,TAU,128,line_color,line_width,false)
	
func _process(delta):
	queue_redraw()
