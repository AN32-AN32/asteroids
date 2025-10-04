extends Node

var top_left : Vector2
var bottom_right : Vector2

func warp(pos: Vector2, offset: float) -> Vector2:
	var position = pos
	if position.x <= Global.top_left.x - offset:
		position.x = Global.bottom_right.x + offset
	elif position.x >= Global.bottom_right.x + offset:
		position.x = Global.top_left.x - offset
	
	if position.y <= Global.top_left.y - offset:
		position.y = Global.bottom_right.y + offset
	elif position.y >= Global.bottom_right.y + offset:
		position.y = Global.top_left.y - offset
	return position
