extends ColorRect

var fade_tween: Tween

func _ready():
	self.visible = false

func fade_screen(fade_to_black: bool, callback: Callable) -> void:
	self.visible = true

	var fader_color = 1.0 if fade_to_black else 0.0
	
	if is_instance_valid(fade_tween) && fade_tween.is_running():
		fade_tween.stop()
	
	fade_tween = get_tree().create_tween()
	fade_tween.tween_property(self, "modulate:a", fader_color, 1.5)
	
	if not callback.is_null():
		fade_tween.tween_callback(callback)
