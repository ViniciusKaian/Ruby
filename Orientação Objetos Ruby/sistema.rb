require_relative "Livro"
require_relative "revista"
require_relative "ebook"
require_relative "estoque"

def imprime_nota_fiscal(livros)
	livros.each do |livro|
		puts "Titulo: #{livro.titulo} - #{livro.preco}"
	end
end

def livro_para_newslatter(livro)
	if livro.ano_lancamento < 2000
		puts "Newsletter/Liquidacao"
		puts livro.titulo
		puts livro.preco
	end
end



algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "",false)
programmer = Livro.new("Programming Ruby", 100, 1999, true, "", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", false)
online_arquitetura = Ebook.new("Introdução a Arquitetura e Design de Software", 50, 2012, "")
revista = Revista.new("Revista de Ruby", 10, 2012, true, 3, "Revistas")

estoque = Estoque.new

estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << online_arquitetura

estoque.vende ruby
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende online_arquitetura

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
