extends Node

signal health_changed(old_health, new_health, max_health)
signal coin_collected(value)

var total_coin: int = 0:
	set = set_total_coin

func set_total_coin(value) -> void:
	total_coin += value
