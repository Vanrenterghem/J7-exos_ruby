jour_1 = { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 }
jour_2 = { :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 }
jour_3 = { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 }
jour_4 = { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 }
jour_5 = { :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 }
jour_6 = { :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 }
jour_7 = { :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }

sample=[17,3,6,9,15,8,6,1,10]
hash_sample = [jour_1, jour_2, jour_3, jour_4, jour_5, jour_6, jour_7]

def largest_hash_key(hash)
  hash.max_by{|k,v| v}
end


def trader_du_dimanche (price)
	max_of_differences = Hash.new
	for i in 0...price.length - 1 
		differences = []
		for j in i+1...price.length
			differences.push(price[j] - price[i])
		end
		max_of_differences[i] = [differences.max,differences.index(differences.max)]	
	end
	abs_max = max_of_differences.max_by{|k,v| v[0]}
	days = [abs_max[0]+1, abs_max[0] + abs_max[1][1] + 2]
	profit = abs_max[1][0]
	return "les jours pour acheter puis vendre sont #{days}, avec un bénéfice de #{profit}"
end


def trader_du_lundi (array_of_hash)
	prices_per_stock = Hash.new
	
	array_of_hash.each do |hash|
		hash.each do |key, value|
			prices_per_stock[key]=[]
		end
	end
	
	array_of_hash.each do |hash|
		hash.each do |key, value|
			prices_per_stock[key] << value
		end
	end

	puts prices_per_stock

	prices_per_stock.each do |key, value|
		output = "Pour " + key.to_s + ", " + trader_du_dimanche(prices_per_stock[key]) + "."
		puts output
	end
end

trader_du_lundi (hash_sample)
