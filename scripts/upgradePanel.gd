extends Panel

@onready var merchant: AnimatedSprite2D = $"../merchantPanel/merchant"
@onready var bytesAmount: Button = $"../bytesAmount"

var bytes = 50
var value: int

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
