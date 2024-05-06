@tool
extends Node3D


@export var _book_data : book_page_data

@export var page_index : int = 0
@export var img_symbol : CompressedTexture2D
@export var img_page_alpha : CompressedTexture2D

@onready var render_page = $Render_page
@onready var render_symbols = $Render_symbols

@onready var page_mat : Material = render_page.get_surface_override_material(0)
@onready var symb_mat : Material = render_symbols.get_surface_override_material(0)

func _run():
	page_mat.set_shader_parameter("Alpha",img_page_alpha)
	symb_mat.set_shader_parameter("Symbols",img_symbol)

func _ready():
	page_mat.set_shader_parameter("Alpha",img_page_alpha)
	symb_mat.set_shader_parameter("Symbols",img_symbol)


func _on_show_this_page_show_this_page():
	_book_data.book_node._show_from_index(page_index)
	var book_position = _book_data.book_node.position
	_global_datas.focus_this_on_board.emit(book_position)
