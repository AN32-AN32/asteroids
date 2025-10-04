extends Area2D

var dir : float
const SPEED : int = 2000

@onready var screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var velocity = Vector2(SPEED, 0).rotated(dir)
	position += velocity * delta
	position = Global.warp(position, 10)

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, Color.WHITE)

func _on_timer_timeout() -> void:
	queue_free()
