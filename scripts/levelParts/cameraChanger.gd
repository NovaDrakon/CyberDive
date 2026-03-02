extends Area2D

@onready var topLeftMarker: Marker2D = $topLeft
@onready var bottomRightMarker: Marker2D = $bottomRight
@onready var gameCamera: Camera2D = $"../../mainCharacter/gameCamera"

var inRange = false
var topLeft: Vector2
var bottomRight: Vector2

func _ready() -> void:
	topLeft = topLeftMarker.get_global_position()
	bottomRight = bottomRightMarker.get_global_position()

func _on_body_entered(_body: Node2D) -> void:
	fixCamera()

func fixCamera():
	gameCamera.limit_top = int(topLeft.y)
	gameCamera.limit_left = int(topLeft.x)
	gameCamera.limit_bottom = int(bottomRight.y)
	gameCamera.limit_right = int(bottomRight.x)
