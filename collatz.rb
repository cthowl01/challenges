# Collatz Sequence Challenge
# Author: Chris Howle

def collatz(num)

    collatz_array = Array.new(num) { Array.new(1) }

    max_length = 1
    max_index = 0

    if num == 1
        return max_length
    end

    n = 600000

    while n <= num

        # Use i to track the index for each sequence
        # i will reset to 0 for each n up to the passed value
        i = 0
        new_n = n

        # Store first value before the calculations begin
        collatz_array[n-1][i] = new_n
        #print "#{new_n} stored\n"

        while new_n != 1
            if new_n % 2 == 0
                new_n = new_n/2
            else
                new_n = 3*new_n + 1
            end

            #print "#{new_n} stored\n"
            # Store the calculated value in the two-dimensional array
            collatz_array[n-1][i] = new_n

            # Increment i
            i += 1
            #print "i is now #{i}\n"

            # If i is greater than the current max length, replace max length with i and set max index to n
            if i > max_length
                max_length = i+1
                max_index = n
            end
        end
        # end while

        #if collatz_array[n].length > max_length
            #print "#{n} takes the lead with #{collatz_array[n].length}"
            #max_length = collatz_array[n].length
        # end

        n += 1
        #print "n is now #{n}\n"

    end # end while

    #collatz_array.each do |i|
        #puts "#{collatz_array[i][0..19]}"
    #end

    puts "#{max_index} has the longest sequence of #{max_length}"
end

collatz(1000000)