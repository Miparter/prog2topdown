extends Node2D
# Gun.gd

@export var radius: float = 50.0
@export var offset: Vector2 = Vector2(0, -25)
@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.3
@export var ammo: int = 10

var time_since_last_shot: float = 0.0

func _process(delta):
	time_since_last_shot += delta

	if not get_parent():
		return

	# Orbit around player
	var center = get_parent().global_position + offset
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - center).normalized()
	global_position = center + direction * radius

	# Rotate gun sprite
	$Sprite2D.global_rotation = direction.angle()
	$Sprite2D.scale.y = -1 if direction.x < 0 else 1

# Shoot on click (works reliably)
func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	if ammo <= 0:
		print("Out of ammo!")
		return
	if time_since_last_shot < fire_rate:
		return

	time_since_last_shot = 0.0
	ammo -= 1

	if has_node("Muzzle") and bullet_scene:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $Muzzle.global_position
		bullet.global_rotation = global_rotation
		get_tree().current_scene.add_child(bullet)
