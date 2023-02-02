extends Area2D

onready var anim = $"Door Animation"
onready var block = $"Door Body/Door Body Collider"
onready var collider = $"Door Collider"
onready var Scene = get_tree().get_current_scene().get_name() #SW get the name of current scene


func _ready():
	pass

#SW when player entered door's collider, will trigger animation of door open 
func _on_Door_body_entered(body):
	if body.name == "Player" || body.name == "PlayerAlternate":
		anim.play("Open")
		

#SW when open door animation end, will change to next scene
func _on_Door_Animation_animation_finished(anim_name):
	if anim_name == "Open" and Scene == "MainLevel1":
		block.disabled == true
		get_tree().change_scene("res://Scenes/DemoLevel2.tscn")		
	elif anim_name == "Open" and  Scene == "MainLevel2":
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
