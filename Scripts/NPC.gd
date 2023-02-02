extends Area2D

var active = false #SW the visable of questionmark 

#SW when player body enter collider of NPC, will trigger the bodyenter/exit func
func _ready():
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_entered", self, '_on_NPC_body_exited')

func _process(delta):
	$QuestionMark.visible = active

func _on_NPC_body_entered(body):
	if body.name == "Player":
		active = true #SW the visable of questionmark will be true
		dialog() #SW if player enter NPC's collider, will trigger the dialog
		
func _on_NPC_body_exited(body):
	if body.name == "Player": 
		active = false #SW when player exit the NPC's collider, the visable of questionmark will be false

func dialog(): #SW setting of dialog 
	if get_node_or_null('Dialognode') == null:
		get_tree().paused = true
		var dialog = Dialogic.start('timeline-1')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end', self, 'unpause')
		add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false
	
