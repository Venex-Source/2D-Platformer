extends RigidBody2D

func _on_detection_area_body_entered(body):
	if body is Player:
		await get_tree().create_timer(0.1).timeout
		set_deferred("freeze", false)
		$Timer.start()


func _on_timer_timeout():
	queue_free()
