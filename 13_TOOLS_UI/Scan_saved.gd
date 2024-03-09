extends Node
@onready var description_text = $"../Description_Text"
@onready var timer = $Timer

func _ready():
	_global_datas.show_subscene_scanner.connect(_scan_saved)
	
	

func _scan_saved():
	
	timer.start()
		
	description_text.text = "scan saved"
	description_text.visible = true


func _on_timer_timeout():
	description_text.visible = false
	description_text.text = ""
