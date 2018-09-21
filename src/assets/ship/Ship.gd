extends Area2D

export var move_speed = 400.0

enum DIRECTIONS { still=0, right=1, left=-1 }

var direction = DIRECTIONS.still
var cur_index = -1

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	global_position.x += move_speed*delta*direction

func _input(event):
	if event is InputEventScreenTouch:
		if(event.pressed):
			cur_index = event.index
			if(event.position.x < OS.window_size.x/2):
				direction = DIRECTIONS.left
			else:
				direction = DIRECTIONS.right
		elif(event.index == cur_index):
			direction = DIRECTIONS.still
			cur_index = -1

func _on_Ship_area_entered(area):
	if(area.is_in_group("bad")):
		get_tree().reload_current_scene()