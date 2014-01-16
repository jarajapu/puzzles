#!/usr/bin/ruby
##Author : Uday
#Purpose : Print a Pascal's triangle using recursion
#Formula : P(2,1) = P(1,0) + P(1,1)

def pascal_element(row, column)
  if (row < 0) || (column > row) || (column < 0)
    0
  elsif row == 0 && column == 0
    1
  else
    pascal_element(row - 1, column - 1) + pascal_element(row - 1, column)
  end

end

def pascal_row(row)
 complete_row = []
 (0..row).each{|column|
   complete_row.push pascal_element(row,column)
 }
 complete_row
end

#print the first 10 rows of pascal triangle
(0..9).each{|row|
  print pascal_row(row) 
  print "\n"
}

