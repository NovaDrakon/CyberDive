extends Label

var hour = 1
var minute = 0
var second = 0
var hoursPast = 13

@export var time: DesktopData

func _process(_delta) -> void:
	hourChange()
	
	if minute < 10:
		time.timeNum = str(hour) + ":0" + str(minute)
	else:
		time.timeNum = str(hour) + ":" + str(minute)
	
	if hoursPast >= 0 && hoursPast < 12:
		time.timeLabel = "AM"
	elif hoursPast >= 12 && hoursPast < 24:
		time.timeLabel = "PM"
	
	self.text = time.timeNum + " " + time.timeLabel

func hourChange():
	minuteChange()
	
	if hoursPast == 25:
		hoursPast = 0
	
	if hour == 13:
		hour = 1
	elif minute == 60:
		hour += 1
		hoursPast += 1
	
func minuteChange():
	secondChange()
	
	if minute == 60:
		minute = 0
	elif second == 900:
		minute += 1

func secondChange():
	if second == 900:
		second = 0
	else:
		second += 1
