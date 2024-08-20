extends Resource
class_name PhotoData

@export var image : Texture2D
@export var legend: String ="SetALegend"
@export var name : String = "SetaName"
@export var scanner_prefab : PackedScene

# for page book bellow
@export var page_prefab : PackedScene
@export var intrige_state : intrigue_s

@export var info : info_data #Array[info_data] #just to have the list of the info page here

enum intrigue_s {
	
	none,
	question,
	started		
}


