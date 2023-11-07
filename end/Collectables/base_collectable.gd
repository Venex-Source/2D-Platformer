extends Area2D
class_name Collectable

const ITEM_FEEDBACK = preload("res://Effect/item_feedback_effect.tscn")

func item_collected() -> void:
	queue_free()
	instance_item_feedback()

func instance_item_feedback() -> void:
	var item_effect = ITEM_FEEDBACK.instantiate()
	get_parent().add_child(item_effect)
	item_effect.global_position = global_position
