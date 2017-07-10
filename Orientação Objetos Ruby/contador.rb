module Contador
	def @livros.<< (livro)
		push (livro)
		if @maximo_necessario.nil? || @maximo_necessario < size
			@maximo_necessario = size
		end
		self
	end

	def @livros.maximo_necessario
		@maximo_necessario
	end
	attr_reader :maximo_necessario
end
