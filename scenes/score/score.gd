extends Control

@onready var score_label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_updated.connect(_on_score_update)


func _on_score_update() -> void:
	score_label.text = str(ScoreManager.get_score())
