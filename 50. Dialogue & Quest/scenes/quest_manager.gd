extends Node2D


var quest : Quest:
	set(value):
		quest = value
		
		if value.objective == "Fetch":
			%Label.text = "Find " + value.title

func next_quest():
	DialogueManager.current_speaker.dialogue = quest.next_questline
	%Label.text = ""
