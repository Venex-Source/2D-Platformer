extends Area2D

signal chase_began(new_direction)
signal chase_ended



func _on_body_entered(body):
	if is_player(body):
		chase_began.emit( sign(body.global_position.x - self.global_position.x))


func _on_body_exited(body):
	if is_player(body):
		chase_ended.emit()

func is_player(node) -> bool:
	return node is Player
