extends Area2D

var maincode

# Called when the node enters the scene tree for the first time.
func _ready():
	maincode = get_node("/root/Node2D")
	connect("body_entered",self,"_on_Area2D_body_entered")


# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	if(body.get_name() == "Torso"):
		maincode.health.value -= 10
		maincode.profile.play("hurt")
