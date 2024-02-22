extends CharacterBody2D

const GRAVITY: float = 1500.0
const POWER: float = -500

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_player_died.connect(on_died)


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	jump_if_pressed()
	move_and_slide()


func jump_if_pressed() -> void:
	if Input.is_action_just_pressed("jump") == true:
		velocity.y = POWER

func on_died() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false)
