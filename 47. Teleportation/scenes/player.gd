extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var cast: Timer = $Cast
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var SFX = {
	"Blink" : "res://47. Teleportation/assets/Blink_start_(AM).mp3.mp3",
	"Teleport" : "res://47. Teleportation/assets/Teleport.mp3.mp3"
}

func animation():
	if velocity.length() == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")

func check_direction():
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

func _physics_process(delta):
	animation()
	check_direction()
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")*200
	move_and_slide()
	
	progress_bar.value = cast.wait_time - cast.time_left
	
func casting(time =1.0):
	play_SFX(SFX["Teleport"])
	progress_bar.max_value = time
	progress_bar.show()
	
	cast.wait_time = time
	cast.start()

	$SpriteVFX.play("heartstone")

func _on_cast_timeout() -> void:
	progress_bar.hide()

func play_VFX():
	$ParticleVFX.emitting = true
	play_SFX(SFX["Blink"])

func play_SFX(SFX_name):
	audio.stream = load(SFX_name)
	audio.play()
