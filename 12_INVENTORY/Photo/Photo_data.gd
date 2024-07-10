extends Resource
class_name PhotoData

@export var image : Texture2D
@export var legend: String ="SetALegend"
@export var name : String = "SetaName"
@export var scanner_prefab : PackedScene

@export var page_index : int

# for page book bellow
@export var page_prefab : PackedScene
@export var intrige_state : intrigue_s
@export var list_of_information : Array[info_data]

enum intrigue_s {
	
	none,
	question,
	started		
}


