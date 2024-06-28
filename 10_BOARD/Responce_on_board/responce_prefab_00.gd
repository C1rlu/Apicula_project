extends Node3D


signal active(condition : bool)

@onready var render_responce = $Render_responce
@onready var col = $Area3D/col

func _on_active(condition):
	render_responce.visible = condition
	col.disabled = !condition	
