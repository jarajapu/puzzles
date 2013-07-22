#!/usr/bin/ruby
#Author: Uday
#Purpose : print all the permutations and combinations of a 5X5 grid

def permunate (linear_array)
 (1..linear_array.length).each{|combine_index| 
   linear_array.combination(combine_index).each{|i| 
     i.permutation.each{|j| 
       print j
       puts ""
     } 
   }
 }
end

input_array = [['a','b','c','d','e'],['f','g','h','i','j'],['k','l','m','n','o'],['p','q','r','s','t'],['u','v','w','x','y']]

(0..4).each{|row|
  permunate(input_array[row])
  this_column=[]
  (0..4).each{|column|
    this_column.push(input_array[column][row])
  } 
  permunate(this_column)
}

