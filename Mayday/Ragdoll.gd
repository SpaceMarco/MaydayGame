extends Node2D

var stopstate = false

var _update = false
var power = 20
export var cum= false
var showline = false

onready var health = get_node("/root/Node2D/CanvasLayer/Control/Health")
onready var oxygen = get_node("/root/Node2D/CanvasLayer/Control/Oxygen")
onready var help = get_node("/root/Node2D/CanvasLayer/Control/help")
onready var profile = get_node("/root/Node2D/CanvasLayer/Control/aboali")
onready var dead = get_node("/root/Node2D/CanvasLayer/end")
onready var win = get_node("/root/Node2D/CanvasLayer/won")
onready var anim = get_node("/root/Node2D/ship/AnimationPlayer")
onready var anim2 = get_node("/root/Node2D/ship2/AnimationPlayer")

var gen
var h1 = true
var h2 = true

func _draw():
	if(showline):
		draw_line(gen.global_position, $Player/Torso.global_position , Color.aqua, 5)
		_update = true

# warning-ignore:unused_argument
func _process(delta):
	if(!stopstate):
		
		if(showline):
			_update=true
		
		help.value +=0.05
		
		if(_update):
			update()
			_update=false
		
		if(cum):
			oxygen.value +=0.5
		else:
			oxygen.value -=0.4
		
		if(help.value == 100):
			win.visible = true
			#get_node("/root/Node2D/ship/AnimationPlayer").stop()
			if(h1):
				anim.play("end")
			stopstate= true
		elif(help.value == 50):
			if(h2):
				anim2.play("mid")
		
		if(oxygen.value == 100):
			profile.play ("normal")
			health.value +=0.2
		elif(oxygen.value == 0):
			profile.play ("sufficate")
			health.value -=0.2
			
			if(health.value == 0):
				dead.visible = true
				profile.play("dead")
				stopstate= true
		
		
		if(Input.is_action_pressed("ui_up")):
			$Player/Torso.apply_impulse(Vector2.ZERO, Vector2.UP*power)
		if(Input.is_action_pressed("ui_left")):
			$Player/Torso.apply_impulse(Vector2.ZERO, Vector2.LEFT * power)
		if(Input.is_action_pressed("ui_down")):
			$Player/Torso.apply_impulse(Vector2.ZERO, Vector2.DOWN * power)
		if(Input.is_action_pressed("ui_right")):
			$Player/Torso.apply_impulse(Vector2.ZERO, Vector2.RIGHT * power)
	
	
	if(Input.is_action_pressed("ui_cancel")):
		get_tree().quit()


func _on_AnimationPlayer_animation_finished(anim_name):
	h1= false



func _on_AnimationPlayer_animation2_finished(anim_name):
	h2= false
