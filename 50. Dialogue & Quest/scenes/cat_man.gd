extends CharacterBody2D

@export var dialogue : Dialogue

func interact():
	DialogueManager.dialogue = dialogue
	DialogueManager.current_speaker = self
	DialogueManager.show_dialogue()
