extends Node

@onready var camera: Camera2D = $"../Camera2D"
var enemy_path = preload("res://scenes/enemy.tscn")

func _ready() -> void:
	var viewport_size = camera.get_viewport_rect().size
	var xform = camera.get_canvas_transform().affine_inverse()
	
	Global.top_left = xform * Vector2(0, 0)
	Global.bottom_right = xform * viewport_size
	
	var enemy = enemy_path.instantiate()
	enemy.position = Vector2(100, 100)
	enemy.velocity = Vector2(0.6, -0.9)
	add_child(enemy)

func _process(_delta: float) -> void:
	for child in get_children():
		child.position = Global.warp(child.position, child.radius)
