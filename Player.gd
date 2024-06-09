extends CharacterBody2D

# constants && variables
const speed = 100

var direction = 0
var moving = false

func _process(delta):
	moving = false # set moving to false so, if you're not moving, the animation doesn't play
	# read inputs
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
		direction = 2
		moving = true
		$PlayerSpriteAnimated.animation = "walk_up"
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
		direction = 0
		moving = true
		$PlayerSpriteAnimated.animation = "walk_down"
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
		direction = 1
		moving = true
		$PlayerSpriteAnimated.animation = "walk_left"
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
		direction = 3
		moving = true
		$PlayerSpriteAnimated.animation = "walk_right"
	# animate
	if moving:
		$PlayerSpriteAnimated.play()
