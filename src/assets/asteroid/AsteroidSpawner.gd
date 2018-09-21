extends Node2D

export (PackedScene) var asteroid_pack
export var spawn_time_range = Vector2(0.2, 1)
export var difficulty_per_second = 2

var spawn_timer = 0.0
var cur_spawn_time = spawn_time_range.y
var start_time

func _ready():
	start_time = OS.get_unix_time()
	set_process(true)

func _process(delta):
	if(spawn_timer >= cur_spawn_time):
		var cur_difficulty = difficulty_per_second * (OS.get_unix_time() - start_time)
		spawn_timer = 0
		cur_spawn_time = rand_range(spawn_time_range.x, spawn_time_range.y)
		cur_spawn_time -= (cur_difficulty/100)
		var cur_asteroid = asteroid_pack.instance()
		cur_asteroid.global_position = Vector2(rand_range(0, OS.window_size.x), 0)
		cur_asteroid.down_move_speed = cur_asteroid.down_move_speed + difficulty_per_second