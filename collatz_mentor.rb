

def collatz(num, dict)

  length = 0

  while (num != 1)
    length += 1
    if dict.include?(num)
      return length - 1 + dict[num]
    end
    if num % 2 == 0
        num= num/2
    else
        num= 3*num+ 1
    end

  end

end

def find_max_collatz(num)

  max_input = 1

  dict = {1 => 1, 2 => 2}

  (3..num).each do |n|
    dict[n] = collatz(n, dict)
    if (dict[n] > dict[max_input])
      max_input = n
    end
  end
  return [ max_input, dict[max_input] ]
end


puts find_max_collatz(1000000)