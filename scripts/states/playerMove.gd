extends State
class_name PlayerMove

@export var player: CharacterBody2D
@export var weapon: Area2D
@export var wait: float

@onready var attackDelay: Timer = $"../../attackDelay"
@onready var animatedSprite2D: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var jumpBuffer: Timer = $"../../jumpBuffer"

var speed := 180
var jump := -310
var gravity := 950
var accelertation := 900
var friction := 1000

var coyoteTime := 0.1
var coyoteTimer := 0.0

func Update(_delta: float):
	#Attack
	if Input.is_action_just_pressed("Attack"):
		animatedSprite2D.play("Attack")
		weapon.show()
		await get_tree().create_timer(wait).timeout
		weapon.hide()
		animatedSprite2D.play("Idle")

func PhysicsUpdate(delta: float):
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
	
	#Move
	var direction := Input.get_axis("Left", "Right")

	if direction:
		player.velocity.x = move_toward(player.velocity.x, direction * speed, accelertation * delta)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, friction * delta)
	
	#Jump
	if player.is_on_floor():
		coyoteTimer = coyoteTime
	else:
		coyoteTimer -= delta
	
	if Input.is_action_just_pressed("Jump"):
		jumpBuffer.start()
	
	if Input.is_action_just_pressed("Jump") and coyoteTimer > 0:
		player.velocity.y = jump
		coyoteTimer = 0
		animatedSprite2D.play("Jump")
	
	if Input.is_action_just_released("Jump") and player.velocity.y < 0:
		player.velocity.y = jump / 4.0
		animatedSprite2D.play("Jump")
	
	if player.is_on_floor() and !jumpBuffer.is_stopped():
		player.velocity.y = jump
		animatedSprite2D.play("Jump")
