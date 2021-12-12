extends KinematicBody2D

export var max_velocity = 50
export var max_force = 0.5
export var max_speed = 200
export var mass = 1
export var collision_avoidance = 1
onready var player = get_node("../Player")
var velocity = Vector2(0, 0)
var desired_velocity = Vector2(0, 0)
var steering = Vector2(0, 0)
var destination = Vector2(0, 0)

func _ready():
	pass
	
func set_destination(pos):
	destination = pos
	
func _process(delta):
	set_destination(player.position)
	var ahead = position + velocity.normalized() * collision_avoidance
	
	desired_velocity = (destination - position).normalized() * max_velocity
	steering = desired_velocity - velocity
	
	steering = steering.clamped(max_force)
	steering = steering / mass
 
	velocity = (velocity + steering).clamped(max_speed)
	position = position + velocity * delta
	
	# Make the enemy look in the direction it is moving
	$Sprite.rotation = velocity.angle()
	
