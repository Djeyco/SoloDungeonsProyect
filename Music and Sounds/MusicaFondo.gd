extends AudioStreamPlayer

func musica_fondo_on(musica):
	self.stream = musica
	self.play()

func musica_fondo_off(musica):
	self.stream = musica
	self.stop()
