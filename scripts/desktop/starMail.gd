extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"

var mailOpen := false

func _ready() -> void:
	loadShopWindow()
	
	if mailOpen == true:
		self.show()
		starMailTab.show()
		starMailTab.set_pressed(true)
	else:
		self.hide()
		starMailTab.hide()
		starMailTab.set_pressed(false)

func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	starMailTab.hide()
	mailOpen = false
	saveShopWindow()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	mailOpen = true
	saveShopWindow()

func saveShopWindow():
	SaveSystem.set_var("mail", mailOpen)
	SaveSystem.save(GlobalVars.filePath)
	
func loadShopWindow():
	mailOpen = SaveSystem.get_var("mail", mailOpen)
	
	
func _on_debug_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/debug1.tscn")

func _on_debug_button_2_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/debug2.tscn")

func _on_tutorial_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/levelTutorial.tscn")

func _on_lvl_1_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/levelEasy.tscn")

func _on_lvl_2_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/levelMedium.tscn")

func _on_lvl_3_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/levelHard.tscn")

func _on_boss_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file.call_deferred("res://scenes/levelScenes/levelBoss.tscn")
