extends Node


@onready var icon = $"../Icon_render"
@onready var icon_sh = $"../Icon_sh"

const CURSOR_EYES = preload("res://10_BOARD/00_BOOK/01_UI/cursor_eyes.png")
const CURSOR_TURN_LEFT = preload("res://10_BOARD/00_BOOK/01_UI/cursor_turn_left.png")
const CURSOR_TURN_RIGHT = preload("res://10_BOARD/00_BOOK/01_UI/cursor_turn_right.png")
const CURSOR_BOOK = preload("res://10_BOARD/00_BOOK/01_UI/cursor_book.png")
const CURSOR_PLUME = preload("res://10_BOARD/00_BOOK/01_UI/cursor_plume.png")
const CURSOR_SCAN = preload("res://10_BOARD/00_BOOK/01_UI/cursor_scan.png")
func _ready():
	pass
	#_global_datas.switch_icon_cursor.connect(_swithc_icon)
	
func _swithc_icon(icon_type : icon_class.icon_list):
	
	if icon_type == icon_class.icon_list.SHOW_MAP:
		icon.texture = CURSOR_EYES		
		icon_sh.texture = CURSOR_EYES	
			
	if icon_type == icon_class.icon_list.SHOW_BOOK:
		icon.texture = CURSOR_BOOK	
		icon_sh.texture = CURSOR_BOOK	
	if icon_type == icon_class.icon_list.SHOW_PLUME:
		icon.texture = CURSOR_PLUME
		icon_sh.texture = CURSOR_PLUME
	if icon_type == icon_class.icon_list.SHOW_SCAN:
		icon.texture = CURSOR_SCAN
		icon_sh.texture = CURSOR_SCAN	
	if icon_type == icon_class.icon_list.TURN_PAGE_RIGHT:
		icon.texture = CURSOR_TURN_LEFT
		icon_sh.texture = CURSOR_TURN_LEFT		
	if icon_type == icon_class.icon_list.TURN_PAGE_LEFT:
		icon.texture = CURSOR_TURN_RIGHT
		icon_sh.texture =  CURSOR_TURN_RIGHT
	
