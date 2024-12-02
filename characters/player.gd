class_name Player extends CharacterBody2D

var move_speed : float = 100.0
var jump_force : float = 200.0

var score : int = 0

@onready var score_text: Label = $CanvasLayer/ScoreText

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
		
	velocity.x = 0
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= move_speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += move_speed
		
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y -= jump_force
		
	move_and_slide()
	
	if global_position.y > 100:
		game_over()
	
	score_text.text = "Score: %s" % score


func game_over() -> void:
	get_tree().reload_current_scene()

func add_score(amount: int) -> void:
	score +=  amount
