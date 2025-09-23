extends Label

var hour = 1
var minute = 0
var second = 0

func _process(_delta) -> void:
	hourChange()
	
	if minute < 10:
		self.text = str(hour) + ":0" + str(minute) + " PM"
	else:
		self.text = str(hour) + ":" + str(minute) + " PM"

func hourChange():
	minuteChange()
	
	if hour == 13:
		hour = 1
	elif minute == 60:
		hour += 1
	
func minuteChange():
	secondChange()
	
	if minute == 61:
		minute = 0
	elif second == 600:
		minute += 1

func secondChange():
	if second == 600:
		second = 0
	else:
		second += 1
