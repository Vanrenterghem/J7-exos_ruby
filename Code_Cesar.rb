def chiffre_de_cesar(text, number)
	l = text.length
	i = 0
	shifted=Array.new 
	text_to_ascii = text.chars.map(&:ord)  # on crée text_to_ascii qui transforme notre string texte en tableau de chiffre ascii
	#print text_to_ascii #verification

	#on gère le probleme de la boucle pour renvoyer 97 (lettre a) quand on est a 123 (après la lettre z )
	while i < l
		if text_to_ascii[i] >= 122 - number
		shifted[i] = text_to_ascii[i] + number -97 +122-50
		else
	 	shifted[i] = text_to_ascii[i] + number  
		end			
  		i=i+1
	end
	#print shifted verification

rotated_string = shifted.map { |a| a.chr }.join #on transforme le tableau shited en rotated string qui va reprendre les chiffres et leur donné une correspondance en lettre'

puts rotated_string
 
end

chiffre_de_cesar("xyz", 3)
