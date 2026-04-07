extends AnimatedSprite2D

func _process(_delta: float) -> void:
	loadHealth()
	
	match GlobalVars.health:
		100:
			self.set_frame(20)
		95:
			self.set_frame(19)
		90:
			self.set_frame(18)
		85:
			self.set_frame(17)
		80:
			self.set_frame(16)
		75:
			self.set_frame(15)
		70:
			self.set_frame(14)
		65:
			self.set_frame(13)
		60:
			self.set_frame(12)
		55:
			self.set_frame(11)
		50:
			self.set_frame(10)
		45:
			self.set_frame(9)
		40:
			self.set_frame(8)
		35:
			self.set_frame(7)
		30:
			self.set_frame(6)
		25:
			self.set_frame(5)
		20:
			self.set_frame(4)
		15:
			self.set_frame(3)
		10:
			self.set_frame(2)
		5:
			self.set_frame(1)
		
	if GlobalVars.health <= 0:
		self.set_frame(0)
	
	saveHealth()

func saveHealth():
	SaveSystem.set_var("health", GlobalVars.health)
	SaveSystem.save(GlobalVars.filePath)

func loadHealth():
	GlobalVars.health = SaveSystem.get_var("health", GlobalVars.health)
