extends Control

@onready var Song:= $menusong
@onready var buttons: VBoxContainer = $buttons
@onready var options: Panel = $options

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Song.play()
	buttons.visible = true
	options.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_options_pressed() -> void:
	buttons.visible = false
	options.visible = true

func _on_options_close_pressed() -> void:
	buttons.visible = true
	options.visible = false
func _on_quit_pressed() -> void:
	get_tree().quit()
