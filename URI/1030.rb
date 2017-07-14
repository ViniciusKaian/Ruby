def insere_pessoas_circulo(numero_pessoas_circulo)
    pessoas_circulo = []
    for pessoa in 1..numero_pessoas_circulo
        pessoas_circulo << pessoa
    end
    return pessoas_circulo
end

def josephus(numero_pessoas_circulo, salto)
    saltos = salto
    pessoas = []
    numero_pessoas = 0
    while(numero_pessoas < numero_pessoas_circulo)
        if(saltos > numero_pessoas_circulo)
            saltos = saltos - numero_pessoas_circulo
        end
        puts saltos
        numero_pessoas += 1
        saltos += salto
    end
    return pessoas
end
# 5 pessoas
# p[1, 2, 3, 4, 5]
# 2 delete
# 4 pessoas
# p[1, 3, 4, 5]
# 4 delete
# 3 pessoas
# p[1, 3, 5]
# 1 delete
# 2 pessoas
# p[3, 5]
# 5 delete
# 1 pessoas
# p[3]

n = gets.to_i
k = gets.to_i
pessoas_circulo = []
pessoas_circulo = insere_pessoas_circulo(n)
puts "A: #{pessoas_circulo}"
puts "R:" + josephus(n, k).to_s
