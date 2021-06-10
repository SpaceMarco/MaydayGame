extends Node2D

func _ready():
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) #to process
	timer.start(11) #to start

func _on_timer_timeout():
	print_debug("deleted")
	queue_free()

func _process(delta):
	position.y+=1
	
