extends Area2D

@export var speed: float = 600
@export var lifetime: float = 2.0

var velocity: Vector2 = Vector2.ZERO

func _ready():
	velocity = Vector2.RIGHT.rotated(global_rotation) * speed
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	position += velocity * delta

func _on_body_entered(body):
	queue_free()
