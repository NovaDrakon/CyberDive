extends Panel

@onready var dualWield: Button = $dualWield
@onready var strongerBow: Button = $strongerBow
@onready var greaterSword: Button = $greaterSword
@onready var fasterSwing: Button = $fasterSwing
@onready var quickDraw: Button = $quickDraw
@onready var fullSpeed: Button = $fullSpeed
@onready var swordEnchant: Button = $swordEnchant
@onready var bowEnchant: Button = $bowEnchant
@onready var greatEnchant: Button = $greatEnchant
@onready var strongShot: Button = $strongShot
@onready var hotFire: Button = $hotFire
@onready var greaterHeal: Button = $greaterHeal
@onready var dualShot: Button = $dualShot
@onready var bigFire: Button = $bigFire
@onready var fastHeal: Button = $fastHeal
@onready var tripleShot: Button = $tripleShot
@onready var dualFlame: Button = $dualFlame
@onready var fullHeal: Button = $fullHeal

@onready var merchant: AnimatedSprite2D = $"../merchantPanel/merchant"
@onready var bytesAmount: Button = $"../bytesAmount"

var bytes = 50
var value: int

#Buttons
func _on_dual_wield_pressed() -> void:
	pass # Replace with function body.

func _on_stronger_bow_pressed() -> void:
	pass # Replace with function body.

func _on_greater_sword_pressed() -> void:
	pass # Replace with function body.

func _on_faster_swing_pressed() -> void:
	pass # Replace with function body.

func _on_quick_draw_pressed() -> void:
	pass # Replace with function body.

func _on_full_speed_pressed() -> void:
	pass # Replace with function body.

func _on_sword_enchant_pressed() -> void:
	pass # Replace with function body.

func _on_bow_enchant_pressed() -> void:
	pass # Replace with function body.

func _on_great_enchant_pressed() -> void:
	pass # Replace with function body.

func _on_strong_shot_pressed() -> void:
	pass # Replace with function body.

func _on_hot_fire_pressed() -> void:
	pass # Replace with function body.

func _on_greater_heal_pressed() -> void:
	pass # Replace with function body.

func _on_dual_shot_pressed() -> void:
	pass # Replace with function body.

func _on_big_fire_pressed() -> void:
	pass # Replace with function body.

func _on_fast_heal_pressed() -> void:
	pass # Replace with function body.

func _on_triple_shot_pressed() -> void:
	pass # Replace with function body.

func _on_dual_flame_pressed() -> void:
	pass # Replace with function body.

func _on_full_heal_pressed() -> void:
	pass # Replace with function body.

#Other functions
func checkBytes(cost, item):
	if bytes < cost:
		merchant.play("No Money")
	else:
		item.set_disabled(true)
		merchant.play("Purchase Made")
		updateBytes()

	await get_tree().create_timer(2).timeout
	merchant.play("Idle")

func updateBytes():
	bytes -= value
	bytesAmount.text = str(bytes)
