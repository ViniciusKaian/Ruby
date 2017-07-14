def t(var)
    var = var + 1
    puts "Teste: #{var}"
    t var
end

t 0
