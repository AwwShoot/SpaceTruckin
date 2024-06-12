extends CharacterBody2D

# constants && variables
const speed = 90

var direction = 0 # 0-3, each corresponding with a direction
var moving = false # determines if animation plays

# functions

func placeguy(): # feel free to give this a better name, anyone
	# initialize direction & idle pose
	$PlayerSpriteAnimated.animation = "walk_down"
	$PlayerSpriteAnimated.frame = 3

# called when the node enters the scene tree for the first time
func _ready():
	placeguy()

# called every frame
func _process(delta):
	moving = false # set moving to false so if you're not moving it won't stay true
	
	# read inputs
	
	# in the current order, the left-right animations will play when going diagonally,
	# which i (jacky) prefer the look of, but this can be easily changed
	if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		position.y -= speed * delta
		direction = 2 # up
		moving = true
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		position.y += speed * delta
		direction = 0 # down
		moving = true
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		position.x -= speed * delta
		direction = 1 # left
		moving = true
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		position.x += speed * delta
		direction = 3 # right
		moving = true
		
		# animate
		
	# if just pressed move button || just released button that was preventing movement
	if Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_up") or Input.is_action_just_released("move_down") or Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right") or Input.is_action_just_released("move_up"):
		# leg out so short presses still show a step from the player
		$PlayerSpriteAnimated.frame = 0 # first step frame
	if moving:
		match(direction): # seperated like this so the animation works even when pressing multiple buttons
			0: # down
				$PlayerSpriteAnimated.animation = "walk_down"
			1: # left
				$PlayerSpriteAnimated.animation = "walk_left"
			2: # up
				$PlayerSpriteAnimated.animation = "walk_up"
			3: # right
				$PlayerSpriteAnimated.animation = "walk_right"
		$PlayerSpriteAnimated.play() # play the animation
	else:
		$PlayerSpriteAnimated.stop() # stop the animation
		$PlayerSpriteAnimated.frame = 3 # set frame to an idle standing
