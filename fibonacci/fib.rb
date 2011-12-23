#/usr/bin/ruby

def fib(n)
  a,b=0,1
  while (b<n)
   print a,","
   a,b = b,a+b
  end
   print a
end

puts "fib(20)"
lis = fib(20).split(",")
puts "==end=="

puts "fib(2)"
fib(2)
puts "==end=="

puts "fib(42)"
fib(42)
puts "==end=="
