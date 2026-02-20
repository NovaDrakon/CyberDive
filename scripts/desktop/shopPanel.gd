extends Panel

@onready var sword: Button = $sword
@onready var spear: Button = $spear
@onready var bow: Button = $bow
@onready var byteShot: Button = $byteShot
@onready var firewallWave: Button = $firewallWave
@onready var patch: Button = $patch

@onready var bytesAmount: Button = $"../bytesAmount"
@onready var merchant: AnimatedSprite2D = $"../merchantPanel/merchant"

var value: int

func _ready() -> void:
	loadShopWindow()

#Weapons
func _on_sword_pressed() -> void:
	GameSounds.click.play()
	value = 10
	checkBytes(value, sword)
	saveShopWindow()

func _on_spear_pressed() -> void:
	GameSounds.click.play()
	value = 25
	checkBytes(value, spear)
	saveShopWindow()

func _on_bow_pressed() -> void:
	GameSounds.click.play()
	value = 15
	checkBytes(value, bow)
	saveShopWindow()

#Code spells
func _on_byte_shot_pressed() -> void:
	GameSounds.click.play()
	value = 10
	checkBytes(value, byteShot)
	saveShopWindow()

func _on_firewall_wave_pressed() -> void:
	GameSounds.click.play()
	value = 30
	checkBytes(value, firewallWave)
	saveShopWindow()

func _on_patch_pressed() -> void:
	GameSounds.click.play()
	value = 15
	checkBytes(value, patch)
	saveShopWindow()

#Other functions
func checkBytes(cost, item):
	if GlobalVars.bytes < cost:
		merchant.play("No Money")
	else:
		item.set_disabled(true)
		merchant.play("Purchase Made")
		updateBytes()

	await get_tree().create_timer(2).timeout
	merchant.play("Idle")

func updateBytes():
	GlobalVars.bytes -= value
	bytesAmount.text = str(GlobalVars.bytes)

func saveShopWindow():
	SaveSystem.set_var("bytes", GlobalVars.bytes)
	SaveSystem.save(GlobalVars.filePath)

func loadShopWindow():
	GlobalVars.bytes = SaveSystem.get_var("bytes", GlobalVars.bytes)
	bytesAmount.text = str(GlobalVars.bytes)
