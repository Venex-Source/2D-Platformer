extends Actors
class_name Player

signal game_over

@export var jump_impulse: float = 150.0

@onready var animated_sprite_2d = $AnimatedSprite2D

const MAX_HEALTH = 3
var player_health: int = 3
var damage_taken: bool = false
var start_position: Vector2

func _ready():
	start_position = global_position

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.play(
			"fall" if velocity.y > 0 else "jump"
			)
	else:
		animated_sprite_2d.play("run" if direction else "idle")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jump_impulse
	
	if direction:
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
	
	update_facing_direction()
	move_and_slide()

func update_facing_direction() -> void:
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	elif velocity.x < 0:
		animated_sprite_2d.flip_h = true

func take_damage(amount, body) -> void:
	if not damage_taken:
		if body.global_position.y < get_node("HurtBoxComponent").global_position.y:
			return
		set_physics_process(false)
		animated_sprite_2d.play("hurt")
		var old_health = player_health
		player_health -= amount
		damage_taken = not damage_taken
		Event.emit_signal("health_changed", old_health, player_health, MAX_HEALTH)
		if player_health > 0:
			$ReviveTimer.start()


func extra_live(value) -> void:
	var old_health = player_health
	player_health += value
	Event.emit_signal("health_changed", old_health, player_health, MAX_HEALTH)

func _on_revive_timer_timeout():
	global_position = start_position
	animated_sprite_2d.play("idle")
	damage_taken = false
	set_physics_process(true)
