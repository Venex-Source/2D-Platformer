extends Collectable

@export var coin_value: int = 100

func _ready():
	body_entered.connect(_on_gem_collected)

func _on_gem_collected(_body) -> void:
	item_collected()
	Event.emit_signal("coin_collected", coin_value)
