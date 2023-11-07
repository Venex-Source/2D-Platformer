extends Area2D

@export var next_level: String


func _on_body_entered(body):
	if body is Player:
		$CanvasLayer/fader.fade_screen(true, change_level)

func change_level():
	get_tree().change_scene_to_file(next_level)

func _get_configuration_warnings():
	return "Next Level is empty" if next_level.is_empty() else ""
