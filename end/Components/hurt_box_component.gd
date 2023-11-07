extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var timer = $Timer

func _ready():
	self.connect("area_entered", _on_body_entered)
	timer.timeout.connect(_invicibility_timeout)

func _on_body_entered(hitbox: HitBox) -> void:
	if owner.has_method("take_damage"):
		_invicibile_start()
		owner.take_damage(hitbox.damage, hitbox)

func _invicibility_timeout() -> void:
	collision_shape_2d.disabled = false

func _invicibile_start() -> void:
	collision_shape_2d.set_deferred("disabled", true)
	timer.start()
