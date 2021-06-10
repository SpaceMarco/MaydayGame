extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var s = true

func _physics_process(delta):
	if(s):
		position.y+=2


func _on_Area2D_body_entered(body):
	$Sprite.play("boom")
	s = false
	if(body.get_name() == "Torso"):
		get_node("/root/Node2D").health.value -=5
		get_node("/root/Node2D").profile.play("hurt")


func _on_Sprite_animation_finished():
	if(!s):
		queue_free()
