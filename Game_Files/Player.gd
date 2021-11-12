extends KinematicBody2D


# Declare member variables here. Examples:
var moveSpeed : int = 250

var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()


func _ready():
	pass # Replace with function body.

func changeDirection(velocityX, velocityY):
	vel.x += velocityX
	vel.y += velocityY
	facingDir.x += velocityX
	facingDir.y += velocityY
	
	rotation = facingDir.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process (delta):
	
	vel = Vector2()
	
	if Input.is_action_pressed("move_up"):
		changeDirection(0,-1);
	if Input.is_action_pressed("move_down"):
		changeDirection(0,1)
	if Input.is_action_pressed("move_left"):
		changeDirection(-1,0)
	if Input.is_action_pressed("move_right"):
		changeDirection(1,0)
	
	vel = vel.normalized()
	facingDir = facingDir.normalized()
	
	move_and_slide(vel * moveSpeed)
