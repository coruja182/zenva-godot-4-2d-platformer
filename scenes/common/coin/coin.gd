class_name Coin extends Area2D


var t: float = 0.0

@export var bob_speed : int = 5
@export var bob_height : int = 2

@onready var start_y_position := global_position.y


func _process(delta: float) -> void:
	t += delta
	#var amount_to_move: float = ((sin(t * bob_speed) + 1) / 2) * bob_height
	var amount_to_move: float = sin(t * bob_speed) * bob_height
	position.y = start_y_position + amount_to_move


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		(body as Player).add_score(1)
		queue_free()
