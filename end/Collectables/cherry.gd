extends Collectable

@export var lives: int = 1

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Player:
		if body.player_health < body.MAX_HEALTH:
			body.extra_live(lives)
			item_collected()
