extends CharacterBody2D

# constants && variables
const speed = 100

var direction = 0 # 0-3, each corresponding with a direction
var moving = false # determines if animation plays

func placeguy(): # feel free to give this a better name, anyone
	# initialize direction & idle pose
	$PlayerSpriteAnimated.animation = "walk_down"
	$PlayerSpriteAnimated.frame = 3
	
func _ready():
	placeguy()

func _process(delta):
	moving = false # set moving to false so, if you're not moving, the animation doesn't play
	# read inputs
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
		direction = 2
		moving = true
		$PlayerSpriteAnimated.animation = "walk_up"
		# if player is inputting multiple directions at time,
		# no animation will play because it constantly circles between the two
		# and doesn't get a chance to advance frames
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
	if not moving:
		$PlayerSpriteAnimated.stop()
		$PlayerSpriteAnimated.frame = 3 # set frame to an idle standing
