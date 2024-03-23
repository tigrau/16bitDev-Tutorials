extends CharacterBody2D

const XP_DATABASE = "res://44. Stat Growth/database.json"
const MAX_LEVEL = 4

var XP_Table_Data = {}

var Level : int = 1:
	set(value):
		Level = value
		%Label.text = str(value)
		
		rpgClass.stats_growth(self)
		$AnimatedSprite2D.play("level_up")
		$AudioStreamPlayer.play()
	
			#HP += 20
			#Strength += 4
			#Vitality += 2
			#Agility += 1
			#Defense += 5

var rpgClass

var current_xp = 0:
	set(value):
		current_xp = value
		var max_xp = get_max_xp_at(Level)
		
		if current_xp >= max_xp and Level < MAX_LEVEL:
			Level += 1
			current_xp -= max_xp
		elif Level == MAX_LEVEL:
			current_xp = 0

		var total = min( (XP_Table_Data[str(Level)]["total"] + current_xp), \
		XP_Table_Data[str(MAX_LEVEL)]["total"])
		%TotalXP.text = str(total)

		%ProgressBar.max_value = get_max_xp_at(Level)
		%ProgressBar.value = current_xp

var HP : int :
	set(value):
		HP = value
		%HP.text = str(value)

var Strength : int :
	set(value):
		Strength = value
		%Strength.text = str(value)

var Vitality : int :
	set(value):
		Vitality = value
		HP += 10*(Vitality/4)
		%Vitality.text = str(value)

var Agility : int :
	set(value):
		Agility = value
		%Agility.text = str(value)

var Defense : int :
	set(value):
		Defense = value
		%Defense.text = str(value)

func _ready() -> void:
	XP_Table_Data = get_xp_data()
	print(XP_Table_Data)
	
	rpgClass = Knight.new()
	rpgClass.set_base_stats(self)

func get_xp_data() -> Dictionary:
	var file = FileAccess.open(XP_DATABASE, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	return data

func get_max_xp_at(level):
	return XP_Table_Data[str(level)]["need"]

func _on_gain_xp_pressed() -> void:
	current_xp += 100
