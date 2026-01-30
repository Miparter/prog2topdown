extends Area2D

@export var speed := 600
@export var damage := 20

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

# Called when the bullet collides with something
func _on_bullet_body_entered(body: Node) -> void:
	# Optional: ignore player bullets hitting player
	if body.is_in_group("player"):
		return
	
	# Optional: deal damage if the body has a health script
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
	# Remove the bullet
	queue_free()
