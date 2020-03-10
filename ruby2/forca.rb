def da_boas_vindas
    puts "Bem vindo ao jogo da forca!"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo pra você, #{nome}"
    nome
end

def escolhe_palavra_secreta
    puts "Escolhendo uma palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras... Boa sorte!"
    palavra_secreta
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quer_jogar = quero_jogar.upcase == "N"
end

def pede_um_chute(chutes, erros)
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"
    chute
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        chute = pede_um_chute chutes, erros
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = 0
            for i in 0..(palavra_secreta.size - 1)
                if palavra_secreta[i] == letra_procurada
                    total_encontrado += 1
                end
            end
            if total_encontrado != 0
                puts "Letra encontrada #{total_encontrado} vezes"
            else
                puts "Letra não encontrada."
                erros += 1
            end
        else 
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabéns! Acertou!"
                pontos_ate_agora += 100
                break
            else
                puts "Que pena.. errou"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end
    puts "Você ganhou #{pontos_ate_agora} pontos"
end

nome = da_boas_vindas

loop do 
    joga nome
    if nao_quer_jogar?
        break
    end
end 