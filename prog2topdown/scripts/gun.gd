extends Node2D
const BULLET = preload("res://scenes/bullet.tscn")

@export var radius: float = 50.0        # distance from player center to gun pivot
@export var offset: Vector2 = Vector2(0, -25) # offset from player center
@export var barrel_length: float = 20.0 # distance from gun pivot to barrel tip

@onready var shot_cooldown: Timer = $Timer

var _direction: Vector2 = Vector2.ZERO
var gun_tip: Vector2 = Vector2.ZERO

func _process(delta):
	if not get_parent():
		return
	
	# 1️⃣ Calculate gun pivot center including offset
	var player_center = get_parent().global_position
	var gun_center = player_center + offset
	
	# 2️⃣ Calculate direction from gun center to mouse
	var mouse_pos = get_global_mouse_position()
	_direction = (mouse_pos - gun_center).normalized()
	
	# 3️⃣ Position gun on a circle around player
	global_position = gun_center + _direction * radius
	
	# 4️⃣ Rotate gun to point at mouse
	global_rotation = _direction.angle()
	
	# 5️⃣ Flip sprite if necessary
	if _direction.x < 0:
		scale.y = -1
	else:
		scale.y = 1
	
	# 6️⃣ Calculate the gun tip for bullet spawning
	gun_tip = global_position + _direction * barrel_length

func shoot():
	if not shot_cooldown.is_stopped():
		return
	
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = gun_tip
	new_bullet.direction = _direction
	new_bullet.rotation = global_rotation
	get_tree().current_scene.add_child(new_bullet)
	
	shot_cooldown.start()
