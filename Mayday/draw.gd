extends Position2D

var pos = Vector2.ZERO
var cum = false

var s
var t

func _ready():
	t = get_node("/root/Node2D")
	
	$Area2D.connect("body_entered", self, "_on_Area2D_body_entered")
	$Area2D.connect("body_exited",self,"_on_Area2D_body_exited")



func _on_Area2D_body_entered(body):
	if(body.get_name() == "Torso"):
		t.gen = self
		t.cum = true
		t.showline=true
	#print_debug(t.showline)

func _on_Area2D_body_exited(body):
	if(body.get_name() == "Torso"):
		t.cum = false
		t.showline=false
	
	#print_debug("out")
