extends Actors
class_name MovablePlatform

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
	velocity.x = 0

func slide(direction):
	velocity.x = int(direction.x) * move_speed
