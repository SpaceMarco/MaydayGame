extends Position2D


onready var rock =preload("res://rock.tscn")
onready var rock2 =preload("res://rock2.tscn")
onready var player = get_node("/root/Node2D/Player/Torso")


var x
var timer
var arrayrock = []

onready var rng = RandomNumberGenerator.new()
onready var rngrock = RandomNumberGenerator.new()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	
	arrayrock.append(rock)
	arrayrock.append(rock2)
	
	timer = Timer.new()
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) #to process
	timer.start(0.7) #to start

var posplayer = Vector2.ZERO
func _physics_process(delta):
	posplayer = player.global_position

func _on_timer_timeout():
	rngrock.randomize()
	var rs = rngrock.randi_range(0,1)
	
	
	rng.randomize()
	x = rng.randi_range(posplayer.x-50, posplayer.x+50)
	var r = arrayrock[rs].instance()
	r.position = Vector2(x,position.y)
	add_child(r)
	
	rs = rngrock.randi_range(0,1)
	var s = rng.randi_range(180, 760)
	rng.randomize()
	while(s == x):
		s = rng.randi_range(180, 760)
		
	r = arrayrock[rs].instance()
	r.position = Vector2(s,position.y)
	add_child(r)
