extends Node2D

@export var projectile_a_scene: PackedScene
@export var projectile_f_scene: PackedScene
@onready var projectile_holder = $ProjectileHolder
@onready var left_top_marker = $LeftTopMarker
@onready var right_bottom_marker = $RightBottomMarker
@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_projectiles()
	SignalManager.on_player_died.connect(_on_player_died)
	ScoreManager.set_score(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	spawn_projectiles()

func spawn_projectiles() -> void:
	# Randomize number of spawned projectiles
	var num_projectiles: int = randi_range(3, 6)
	var num_of_a: int = randi_range(0, 3)
	
	# Spawn As
	for a_i in num_of_a:
		_spawn_projectile(projectile_a_scene)
	
	# Spawn Fs
	for f_i in (num_projectiles - num_of_a):
		_spawn_projectile(projectile_f_scene)
	
	
func _spawn_projectile(scene: PackedScene) -> void:
	var x_min = left_top_marker.position.x
	var x_max = right_bottom_marker.position.x
	var y_min = left_top_marker.position.y
	var y_max = right_bottom_marker.position.y
	
	var instance: Node = scene.instantiate()
	instance.position = Vector2(randf_range(x_min, x_max), randf_range(y_min, y_max))
	projectile_holder.add_child(instance)

func _on_player_died() -> void:
	spawn_timer.stop()
