extends KinematicBody2D


# Declare member variables here. Examples:
var movement_speed_forward : int = 10
var movement_speed_strive : int = 5
var movement_speed_backward : int = 5
var rotation_speed : int = 3

var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()
var rotation_dir : int = 0

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
	rotation_dir = 0
		
	if Input.is_action_pressed("move_forward"):
		vel += Vector2(movement_speed_forward, 0).rotated(rotation)
	if Input.is_action_pressed("move_back"):
		vel += Vector2(- movement_speed_backward, 0).rotated(rotation)
	if Input.is_action_pressed("move_right"):
		vel += Vector2(0, movement_speed_strive).rotated(rotation)
	if Input.is_action_pressed("move_left"):
		vel += Vector2(0, - movement_speed_strive).rotated(rotation)
	if Input.is_action_pressed("rotate_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("rotate_right"):
		rotation_dir += 1
	
	rotation += rotation_dir * rotation_speed * delta
	
	vel = vel.normalized()
	facingDir = facingDir.normalized()
	
	move_and_slide(vel * movement_speed_forward * delta * 1000)
