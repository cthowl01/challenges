



def recursive_fib(num)
    if num == 0
        return 0
    elsif num == 1
        return 1
    else
        return recursive_fib(num-1) + recursive_fib(num-2)
    end
end


def iterative_fib(num)

    n = 0
    array = []

    while n <= num
        if n == 0
            array[n] = 0
        elsif n == 1
            array[n] = 1
        else
            array[n] = array[n-1] + array[n-2] 
        end
        n += 1
    end
   return array[num]
end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end