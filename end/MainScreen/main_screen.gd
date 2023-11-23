extends Node2D

@export var next_level: PackedScene

@onready var fader = $CanvasLayer/fader

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			fader.fade_screen(true, get_tree().quit)
		
		elif event.pressed and event.keycode == KEY_ENTER:
			fader.fade_screen(true, change_level)

func change_level():
	get_tree().change_scene_to_packed(next_level)

func _get_configuration_warnings():
	return "ERR! Next level scene is empty" if not next_level else ""
