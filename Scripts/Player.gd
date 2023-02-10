extends KinematicBody2D

signal pickUp()
var can_move = true
onready var anim = $PlayerSprites
onready var Scene = get_tree().get_current_scene().get_name() #SW get the name of current scene
onready var HealthPotion = get_node("res://Objects/HealthPotion.tscn")
signal health_change(new_health) #SW
var health = 3 #SW player have 3 life in the begining
export (int) var speed = 200
var velocity = Vector2()



func _ready():
	print(Scene)
	
	if Scene == "MainLevel1": #SW checks the name of scene, and assign the corresponding position and animation to the scenes 
		self.global_position = Vector2(445,290)
		#$AnimationPlayer.play("runLevel1")
	else:
		self.global_position = Vector2(42,0)
		#$AnimationPlayer.play("Level2")
		#if  $AudioStreamPlayer2D.playing == false:
			#$AudioStreamPlayer2D.play()
	

func get_input(): #SW, player movement
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		anim.play("RunRight")
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		anim.play("RunLeft")
	if Input.is_action_pressed("down"):
		velocity.y += 1
		anim.play("Run")
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		anim.play("RunUp")
	if Input.is_action_just_pressed("space") && Music.isWeapon == 1: #SW, player use space to attack (only when havepicked up a weapon)
		print("m")
		#SW, check animation direction
		if $PlayerSprites.animation == "RunUp": 
			anim.play("AttackUp")
			Music.state = 1
			yield(get_tree().create_timer(2),"timeout")
			Music.state = 0
		elif $PlayerSprites.animation == "RunLeft":
			anim.play("AttackLeft")
			Music.state = 1
			yield(get_tree().create_timer(2),"timeout")
			Music.state = 0
		elif $PlayerSprites.animation == "Run":
			anim.play("Attack")
			Music.state = 1
			yield(get_tree().create_timer(2),"timeout")
			Music.state = 0
		elif $PlayerSprites.animation == "RunRight":
			anim.play("AttackRight")
			Music.state = 1
			yield(get_tree().create_timer(2),"timeout")
			Music.state = 0
				
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if can_move:
		get_input()
		velocity = move_and_slide(velocity)

func take_damage(amount): #SW if health = 0, game will reload
	health -= amount
	anim.play("hurt")
	if health <= 0:
		can_move = false
		anim.play("die")
		$DieMusic.play()
		$Lose.show()		
	emit_signal("health_change", health) #SW

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		take_damage(1) #SW		
	if "HealthPotion" in body.name:
		take_damage(-1) #SW
	if "SpeedPotion" in body.name:
		speed = 500 #SW 
		yield(get_tree().create_timer(3),"timeout")
		speed = 200 #SW
	
	
		


func _on_HealthBar_value_changed(value):
	pass # Replace with function body.
