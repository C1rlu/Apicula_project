extends Node3D

func _on_body_entered(body):
	if body.name == "Detectable":
		var body_script = body.get_script()
		print(body_script)

