extends Control

@onready var game_over_label = $GameOverLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_player_died.connect(_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if space_label.visible == true and Input.is_action_just_pressed("jump") == true:
		ScreenManager.load_main_scene()

func _on_plane_died() -> void:
	show()
	timer.start()
	sound.play()

func _on_timer_timeout():
	game_over_label.hide()
	space_label.show()
