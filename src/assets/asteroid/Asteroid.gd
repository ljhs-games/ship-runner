extends Area2D

enum DIRECTIONS { right=1, left=-1, still=0 }

var rot_direction = DIRECTIONS.still
var down_move_speed = 100.0
var rotation_speed = 30.0

func _ready():
	set_process(true)

func _process(delta):
	global_position.y += down_move_speed*delta
	rotation_degrees = rotation_speed*delta*rot_direction