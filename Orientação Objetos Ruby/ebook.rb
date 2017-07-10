require_relative "produto"
require_relative "impresso"

class Ebook < Produto

	def matches?(query)
		["ebook", "digital"].include?(query)
	end

	def possui_reimpressao?
		@possui_reimpresssao
	end
end
