
def trader_du_dimanche (arr)
    best = 0
    benef = 0
    days = ''

    arr.each do |x|
        y = x + 1
        while arr[y]
            benef = arr[y] - arr[x]
            if benef > best
                best = benef
                days = "#{x+1}, #{y+1} : $#{arr[y]} - $#{arr[x]} = #{best}"
            end
            y += 1
        end
    end
    return days
end


puts trader_du_dimanche ([17,3,6,9,15,8,6,1,10])



