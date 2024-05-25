extends Node

@onready var bounce_engine = $"../Movable_Main_oddity/Bounce_engine"

func _on_fusion_area_area_entered(area):
	if area:
		var oddity = area.get_node_or_null("Fusion_node")
		if oddity:
			oddity.fusion.emit()
			bounce_engine.Bounce_engine()
			
		
