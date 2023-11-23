extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cool_timer: Timer = $CoolTimer

@export var jump_impulse = 40.0

var attack_enemy: bool = false
var just_jumped: bool = false
var direction: int



func _on_attack_box_component_chase_began(new_direction):
	direction = new_direction
	attack_enemy = true
	update_facing_direction()


func _on_attack_box_component_chase_ended():
	attack_enemy = false


func _on_cool_timer_timeout():
	just_jumped = false


func  _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	update_animation()
	jump_chase_movement()
	move_and_slide()
	if just_jumped and cool_timer.is_stopped() and is_on_floor():
		velocity = Vector2.ZERO
		cool_timer.start()

func take_damage(_amount, body) -> void:
	if body.global_position.y > get_node("HurtBoxComponent").global_position.y:
		return
	die()

func jump_chase_movement() -> void:
	if attack_enemy and is_on_floor() and not just_jumped:
		velocity = Vector2(direction * move_speed, -jump_impulse)
		animated_sprite_2d.play("jump")
		just_jumped = true

func update_animation() -> void:
	if velocity.y > 0:
		animated_sprite_2d.play("fall")
	if is_on_floor():
		animated_sprite_2d.play("idle")

func update_facing_direction() -> void:
	if direction > 0:
		animated_sprite_2d.flip_h = true
	elif direction < 0:
		animated_sprite_2d.flip_h = false

