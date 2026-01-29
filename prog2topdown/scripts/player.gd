extends CharacterBody2D

@onready var campfire := $"../Campfire"

@export var speed = 250
@onready var sprite:= $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_var = Vector2.ZERO
	
	
	if Input.is_action_pressed("key_a"):
		input_var.x = -1 * speed 
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("key_d"):
		input_var.x = 1 * speed 
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("key_w"):
		input_var.y = -1 * speed 
	if Input.is_action_pressed("key_s"):
		input_var.y = 1 * speed 
		
		
	if input_var.length() > 0:
		velocity = input_var.normalized() * speed
		sprite.play("running")
	else:
		velocity = Vector2.ZERO
		sprite.play("idle")
		
	move_and_slide()
	
	#Om spelaren är över elden, hamna bakom den
	if self.position.y < (campfire.position.y - 40):
		z_index = 0
	#annars var över i grafik-ordning
	else:
		z_index = 1
