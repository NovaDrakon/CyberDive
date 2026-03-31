extends AnimatedSprite2D

func _process(_delta: float) -> void:
	loadMana()
	
	match GlobalVars.mana:
		60:
			self.set_frame(20)
		57:
			self.set_frame(19)
		54:
			self.set_frame(18)
		51:
			self.set_frame(17)
		48:
			self.set_frame(16)
		45:
			self.set_frame(15)
		42:
			self.set_frame(14)
		39:
			self.set_frame(13)
		36:
			self.set_frame(12)
		33:
			self.set_frame(11)
		30:
			self.set_frame(10)
		27:
			self.set_frame(9)
		24:
			self.set_frame(8)
		21:
			self.set_frame(7)
		18:
			self.set_frame(6)
		15:
			self.set_frame(5)
		12:
			self.set_frame(4)
		9:
			self.set_frame(3)
		6:
			self.set_frame(2)
		3:
			self.set_frame(1)
		0:
			self.set_frame(0)
	saveMana()

func saveMana():
	SaveSystem.set_var("mana", GlobalVars.mana)
	SaveSystem.save(GlobalVars.filePath)

func loadMana():
	GlobalVars.mana = SaveSystem.get_var("mana", GlobalVars.mana)
