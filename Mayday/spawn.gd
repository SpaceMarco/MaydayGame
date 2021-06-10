extends Position2D


# Declare member variables here. Examples:
# var a = 2
var timer
onready var scene_1 = preload("res://set_1.tscn")
onready var scene_2 = preload("res://set_2.tscn")
onready var scene_3 = preload("res://set_3.tscn")

var array = []
var rng 

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	
	array.append(scene_1)
	array.append(scene_2)
	array.append(scene_3)

var x
func _on_Timer_timeout():
	rng.randomize()
	x = rng.randi_range(0,2)
	add_child(array[x].instance())
