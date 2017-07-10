require_relative "contador"

class Estoque
	attr_reader :livros

	def initialize
		@livros = []
        @vendas = []
		@livros.extend Contador
	end
=begin
    def livro_que_mais_vendeu_por(&campo)
        que_mais_vendeu_por("livro",&campo)
    end

    def revista_que_mais_vendeu_por(&campo)
        que_mais_vendeu_por("revista",&campo)
    end

    def ebook_que_mais_vendeu_por(&campo)
        que_mais_vendeu_por("ebook", &campo)
    end
=end
    def method_missing(name)
        # puts "Não encontrei: #{name}"
        matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
        if matcher
            tipo = matcher[1]
            campo = matcher[2].to_sym
            que_mais_vendeu_por(tipo, &campo)
        else
            super
        end
    end

    def respond_to?(name)
        name.to_s.match("(.+)_que_mais_vendeu_por_(.+)") || super
    end

	def exporta_csv
		puts "\n\n"
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def mais_barrato_que(valor)
		#select é um método que recebe um parâmetro que retorna true ou false
		@livros.select do |livro|
			livro.preco <= valor
		end
	end

	def total
		#size retorna o tamanho de um array
		@livros.size
	end

	def adiciona(livro)
		@livros << livro if livro
	end

	def << (livro)
		@livros << livro if livro
		self
	end

	def vende(livro)
		@livros.delete livro
        @vendas << livro
	end

	def maximo_necessario
		@livros.maximo_necessario
	end

    private
    def quantidade_de_vendas_por(produto, &campo)
        @vendas.count {|venda| campo.call(venda) == campo.call(produto)}
    end

    def que_mais_vendeu_por(tipo, &campo)
        @vendas.select { |produto| produto.matches?(tipo)}.sort {|v1,v2| quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo)}.last
    end
end
