extends Node2D

@onready var score_sound = $ScoreSound
@onready var animation_player = $ProjectileArea/AnimationPlayer

func _ready():
	SignalManager.on_player_died.connect(_on_player_died)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= ConstantsManager.PROJECTILE_SPEED * delta


func _on_screen_exited():
	queue_free()


func _on_projectile_area_body_entered(body):
	if body.is_in_group(ConstantsManager.GROUP_PLAYER) == true:
		score_sound.play()
		ScoreManager.increment_score()
		queue_free()

func _on_player_died() -> void:
	animation_player.pause()
	set_physics_process(false)
