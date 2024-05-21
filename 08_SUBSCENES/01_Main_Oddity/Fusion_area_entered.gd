extends Node


func _on_fusion_area_area_entered(area):
	if area:
		var oddity = area.get_node_or_null("Fusion_node")
		if oddity:
			oddity.fusion.emit()
	
			
		
