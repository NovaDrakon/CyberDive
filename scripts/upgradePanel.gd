extends Panel

@onready var dualWield: Button = $dualWield
@onready var fasterSwing: Button = $fasterSwing
@onready var swordEnchant: Button = $swordEnchant
@onready var strongerBow: Button = $strongerBow
@onready var quickDraw: Button = $quickDraw
@onready var bowEnchant: Button = $bowEnchant
@onready var sharpPoint: Button = $sharpPoint
@onready var crowdControl: Button = $crowdControl
@onready var spearEnchant: Button = $spearEnchant
@onready var strongShot: Button = $strongShot
@onready var dualShot: Button = $dualShot
@onready var tripleShot: Button = $tripleShot
@onready var hotFire: Button = $hotFire
@onready var bigFire: Button = $bigFire
@onready var dualFlame: Button = $dualFlame
@onready var greaterHeal: Button = $greaterHeal
@onready var fastHeal: Button = $fastHeal
@onready var fullHeal: Button = $fullHeal
@onready var merchant: AnimatedSprite2D = $"../merchantPanel/merchant"
@onready var bytesAmount: Button = $"../bytesAmount"

var bytes = 50
var value: int

var baseUpgrade = [dualWield, strongerBow, sharpPoint, strongShot, hotFire, greaterHeal]
var secondUpgrade = [fasterSwing, quickDraw, crowdControl, dualShot, bigFire, fastHeal]
var finalUpgrade = [swordEnchant, bowEnchant, spearEnchant, tripleShot, dualFlame, fullHeal]

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
