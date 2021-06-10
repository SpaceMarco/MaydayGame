extends RigidBody2D


# Declare member variables here. Examples:
var a = 10


# Called when the node enters the scene tree for the first time.
func _process(delta):
	apply_impulse(Vector2.ZERO, Vector2.LEFT*a)


