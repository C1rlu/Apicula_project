extends Node

@onready var scanner_pos = $"../Scanner_pos"


func _ready():
	_global_datas.scanner_position = scanner_pos.global_position
	_global_datas.open_board_scanner.connect(open_scanner)
	
func open_scanner(condition : bool, scanner_data : PackedScene):
	
	
	remove_all()	
	if condition:
		var new_scanner = scanner_data.instantiate()
		new_scanner.position = scanner_pos.position
		#new_scanner.scale = Vector3.ONE
		scanner_pos.add_child(new_scanner)


func remove_all():

	var all = scanner_pos.get_children()
	
	for e in all :
		e.queue_free()
