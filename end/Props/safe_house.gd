extends Area2D

@export var next_level: PackedScene


func _on_body_entered(body):
	if body is Player:
		$CanvasLayer/fader.fade_screen(true, change_level)

func change_level():
	get_tree().change_scene_to_packed(next_level)

func _get_configuration_warnings():
	return "ERR! Next level scene is empty" if not next_level else ""
