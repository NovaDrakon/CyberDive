extends Label

var filePath = "user://saveData.sav"

var hour := 7
var minute := 0
var second := 0
var hoursPast := 19

var timeNum := ""
var timeLabel := ""

func _ready() -> void:
	loadTime()

func _process(_delta) -> void:
	hourChange()
	
	if minute < 10:
		timeNum = str(hour) + ":0" + str(minute)
	else:
		timeNum = str(hour) + ":" + str(minute)
	
	if hoursPast > 0 && hoursPast < 12:
		timeLabel = "AM"
	elif hoursPast > 11 && hoursPast < 23:
		timeLabel = "PM"
	
	self.text = timeNum + " " + timeLabel
	saveTime()

func hourChange():
	minuteChange()
	
	if hoursPast == 23:
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
	elif second == 450:
		minute += 1

func secondChange():
	if second == 450:
		second = 0
	else:
		second += 1

func saveTime():
	SaveSystem.set_var("hr", hour)
	SaveSystem.set_var("min", minute)
	SaveSystem.set_var("sec", second)
	SaveSystem.set_var("timeMeridiem", timeLabel)
	SaveSystem.save(filePath)

func loadTime():
	hour = SaveSystem.get_var("hr", hour)
	minute = SaveSystem.get_var("min", minute)
	second = SaveSystem.get_var("sec", second)
	timeLabel = SaveSystem.get_var("timeMeridiem", timeLabel)
