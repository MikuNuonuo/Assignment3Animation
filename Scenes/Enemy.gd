extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	

func _on_Area2D2_body_entered(body):
	if "Player" in body.name and Music.state == 1: #SW, only when player in attack state will trigger this 
			print("xx")
			$HitMusic.play()
			queue_free()
			
			

	
