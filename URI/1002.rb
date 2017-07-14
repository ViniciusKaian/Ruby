def area_do_circulo(raio)
    pi = 3.14159
    pi*(raio*raio)
end

raio = gets.to_f

puts "A=#{format("%.4f", area_do_circulo(raio))}"
