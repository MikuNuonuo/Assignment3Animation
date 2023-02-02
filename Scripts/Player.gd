extends KinematicBody2D

onready var anim = $PlayerSprites
onready var Scene = get_tree().get_current_scene().get_name() #SW get the name of current scene

func _ready():
	print(Scene)
	if Scene == "MainLevel1": #SW checks the name of scene, and assign the corresponding position and animation to the scenes 
		self.global_position = Vector2(488,288)
		$AnimationPlayer.play("runLevel1")
	else:
		self.global_position = Vector2(42,0)
		$AnimationPlayer.play("Level2")
	

