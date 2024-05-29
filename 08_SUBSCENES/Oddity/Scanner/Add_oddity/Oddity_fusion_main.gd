extends Area3D

@export var fusion_effect : Array[Resource]
signal push
func _on_tree_exited():
	
	for f in fusion_effect:
		f.trigger_fusion()
