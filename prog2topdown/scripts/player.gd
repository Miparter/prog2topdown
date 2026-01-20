extends CharacterBody2D


@export var speed = 300.0


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("key_a"):
		velocity.x = -1 * speed 
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("fly_running")
	if Input.is_action_pressed("key_d"):
		velocity.x = 1 * speed 
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("fly_running")
	if Input.is_action_pressed("key_w"):
		velocity.y = -1 * speed 
		$AnimatedSprite2D.play("fly_running")
	if Input.is_action_pressed("key_s"):
		velocity.y = 1 * speed 
		$AnimatedSprite2D.play("fly_running")
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	move_and_slide()
