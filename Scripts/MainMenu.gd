extends Control

onready var menu = $Menu
onready var setting = $AudioVedioOptions
onready var level = $Level
onready var ThanksName = $ThanksName


func _transfer_data_between_scenes(old_scene, new_scene):
	pass

func _on_Start_pressed():
	toggle()
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")
	return
	
func _ready():
	Music.play_music()
		
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
		
func toggle():
	visible = !visible
	get_tree().paused = visible
	

# SW, show the Setting and hide the menu
func _on_Setting_pressed():
	show_and_hide(setting, menu)

	
	
func show_and_hide(first, second):
	first.show()
	second.hide()




func _on_Exit_pressed():
	get_tree().quit()


func _on_Select_a_level_pressed():
	show_and_hide(level, menu)


func _on_Start2_pressed():
	toggle()
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")
	return


func _on_BackfromLevel_pressed():
	show_and_hide(menu, level)


func _on_BackfromSetting_pressed():
	show_and_hide(menu, setting)


func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed
	


func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed


func _on_Master_value_changed(value):
	volume(0,value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_Music_value_changed(value):
	volume(1, value)



func _on_Sound_FX_value_changed(value):
	volume(2, value)


func _on_Level1_pressed():
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")
	
	


func _on_Level2_pressed():
	get_tree().change_scene("res://Scenes/DemoLevel2.tscn")


func _on_Thanks_button_up():
	show_and_hide(ThanksName, menu)
	


func _on_BackfromThanksl_pressed():
	show_and_hide(menu, ThanksName)
