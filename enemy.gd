extends Area2D

var point_count : int = 5
var radius : int = 100
var speed : int = 500
var velocity: Vector2

func _ready() -> void:
	$CollisionShape2D.shape.radius = radius

func _physics_process(delta: float) -> void:
	position += velocity * speed * delta

func _draw() -> void:
	draw_arc(Vector2.ZERO, radius, deg_to_rad(0), deg_to_rad(360), point_count, Color.WHITE, 10)
