

extends Node2D
# GunPivot.gd

@export var radius: float = 50.0    #radien från spelaren
@export var offset: Vector2 = Vector2(0, -25) # offset till mitten av spelaren

func _process(delta):
	if not get_parent():
		return
	
	# 1. Calculate the pivot center (player + offset)
	var center = get_parent().global_position + offset
	
	# 2. Get mouse position
	var mouse_pos = get_global_mouse_position()
	
	# 3. Compute direction from player center to mouse
	var direction = (mouse_pos - center).normalized()
	
	# 4. Set GunPivot position on circle
	global_position = center + direction * radius
	
	# 5. Rotate the gun to point at mouse
	global_rotation = direction.angle()
	
	if direction.x < 0:
		scale.y = -1
	else:
		scale.y = 1
