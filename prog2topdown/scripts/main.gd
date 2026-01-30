extends Node2D


@onready var Fightsong := $fightsong
@onready var optionsingame: Panel = $optionsingame

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	Fightsong.play()
	optionsingame.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		#Togglar motsatsen när escape trycks. start som false, varje tryck switchar
		optionsingame.visible = not optionsingame.visible
		if optionsingame.visible:
			get_tree().paused = true
		else:
			get_tree().paused = false


func _on_backtomenu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
