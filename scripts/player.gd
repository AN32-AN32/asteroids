extends CharacterBody2D

@export var speed : int = 400
@export var rotation_speed : float = 3.0

@onready var bullet_path = preload("res://scenes/bullet.tscn")
const ORIENTATION_OFFSET = PI / 2
const TELEPORT_OFFSET = 100

func _ready() -> void:
	$Body/BodyOutline.points = $Body.polygon

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("right"):
		rotation += rotation_speed * delta
	
	if Input.is_action_pressed("forward"):
		var forward_dir = Vector2.from_angle(rotation - ORIENTATION_OFFSET)
		velocity = forward_dir * speed
		$Thrusters.show()
	else:
		velocity = Vector2.ZERO
		$Thrusters.hide()
	move_and_slide()
	
	position = Global.warp(position, TELEPORT_OFFSET)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		var bullet = bullet_path.instantiate()
		bullet.position = global_position
		bullet.dir = rotation - ORIENTATION_OFFSET
		get_parent().add_child(bullet)
