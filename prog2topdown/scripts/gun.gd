extends Node2D

@export var radius = 50
@export var offset = Vector2(0, -25)

func _process(delta):
	# vet inte om detta är rätt men det funkar typ
	var p = get_parent().global_position + offset
	
	# musen lol
	var m = get_global_mouse_position()
	
	# riktning (tror detta är rätt??)
	var d = (m - p).normalized()
	
	# flytta vapnet runt spelaren
	global_position = p + d * radius
	
	# rotera grejen
	$Sprite2D.global_rotation = d.angle()
	
	# flippa om den går åt fel håll
	if d.x < 0:
		$Sprite2D.scale.y = -1
	else:
		$Sprite2D.scale.y = 1
