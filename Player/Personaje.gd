extends KinematicBody2D

export var aceleracion = 500
export var max_speed = 80
export var roll_speed = 120
export var friccion = 500

enum {
	caminar,
	rodar,
	atacar
}

var estado = caminar
var velocidad = Vector2.ZERO
var vector_rodar = Vector2.DOWN

onready var AnimacionPj = $AnimationPlayer
onready var animationtree = $AnimationTree
onready var animationState = animationtree.get("parameters/playback")
onready var SwordHitbox = $HitboxPivot/SwordHitbox

func _ready():
	animationtree.active = true
	SwordHitbox.vector_retroceso = vector_rodar

func _physics_process(delta):
	match estado:
		caminar:
			estado_caminar(delta)
			
		rodar:
			estado_rodar(delta)
		
		atacar:
			estado_atacar(delta)
		
func estado_caminar(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		vector_rodar = input_vector
		SwordHitbox.vector_retroceso = input_vector
		animationtree.set("parameters/Inactivo/blend_position", input_vector)
		animationtree.set("parameters/Corriendo/blend_position", input_vector)
		animationtree.set("parameters/Atacar/blend_position", input_vector)
		animationtree.set("parameters/Rodar/blend_position", input_vector)
		animationState.travel("Corriendo")
		velocidad = velocidad.move_toward(input_vector * max_speed, aceleracion * delta)
	else:
		animationState.travel("Inactivo")
		velocidad = velocidad.move_toward(Vector2.ZERO, friccion * delta)
	
	Caminar()
	
	if Input.is_action_just_pressed("Rodar"):
		estado = rodar
	
	if Input.is_action_just_pressed("Atacar"):
		estado = atacar

func estado_rodar(delta):
	velocidad = vector_rodar * roll_speed
	animationState.travel("Rodar") 
	Caminar()

func estado_atacar(delta):
	velocidad = Vector2.ZERO
	animationState.travel("Atacar")
	

func Caminar():
	velocidad = move_and_slide(velocidad)

func fin_animacion_rodar():
	velocidad = velocidad * 0.8
	estado = caminar

func fin_estado_atacar():
	estado = caminar




