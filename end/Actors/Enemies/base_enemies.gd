extends Actors
class_name Enemy

@export var mob_point: int = 10
const ENEMYDEATHEFFECT = preload("res://Effect/enemy_death_effect.tscn")

func create_death_effect() -> void:
	var enemyDeathEffect = ENEMYDEATHEFFECT.instantiate()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position

func die() -> void:
	queue_free()
	create_death_effect()
