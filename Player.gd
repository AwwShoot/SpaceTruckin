extends CharacterBody2D

var speed = 100
var direction = 0

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		direction = 1
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		direction = 3
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
		direction = 2
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
		direction = 0
	
