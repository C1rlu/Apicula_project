extends Object

class_name Points

class Point:
	var X: float
	var Y: float
	var StrokeID: int

	func _init(x: float, y: float, strokeId: int) -> void:
		X = x
		Y = y
		StrokeID = strokeId
