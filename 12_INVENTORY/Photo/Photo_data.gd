extends Resource
class_name PhotoData

@export var image : Texture2D
@export var legend: String ="SetALegend"
@export var name : String = "SetaName"
@export var scanner_prefab : PackedScene


@export var page_index : int
@export var board_information_state : int  # 0 = no info, 1 = there is an interogation, 2 you found the information
@export var page_information_state : int = 1 # only for page



