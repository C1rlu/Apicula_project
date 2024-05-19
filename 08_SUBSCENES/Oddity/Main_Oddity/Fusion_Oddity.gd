extends Node


signal add_organic
signal add_sonar

func _on_fusion_area_area_entered(area):
	if area:
		var organic_oddity = area.get_node_or_null("Organic_oddity")
		if organic_oddity:
			organic_oddity.fusion.emit()
			add_organic.emit()
			
		
		var Sonar_oddity = area.get_node_or_null("Sonar_oddity")
		if Sonar_oddity:
			Sonar_oddity.fusion.emit()
			add_sonar.emit()
