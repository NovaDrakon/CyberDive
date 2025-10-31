extends Panel

@onready var sword: Button = $sword
@onready var spear: Button = $spear
@onready var bow: Button = $bow
@onready var byteShot: Button = $byteShot
@onready var firewallWave: Button = $firewallWave
@onready var patch: Button = $patch

@onready var bytesAmount: Button = $"../bytesAmount"
@onready var merchant: AnimatedSprite2D = $"../merchantPanel/merchant"

var bytes = 50
var value: int

#Weapons
func _on_sword_pressed() -> void:
	value = 10
	checkBytes(value, sword)

func _on_spear_pressed() -> void:
	value = 25
	checkBytes(value, spear)

func _on_bow_pressed() -> void:
	value = 15
	checkBytes(value, bow)

#Code spells
func _on_byte_shot_pressed() -> void:
	value = 10
	checkBytes(value, byteShot)

func _on_firewall_wave_pressed() -> void:
	value = 30
	checkBytes(value, firewallWave)

func _on_patch_pressed() -> void:
	value = 15
	checkBytes(value, patch)

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
