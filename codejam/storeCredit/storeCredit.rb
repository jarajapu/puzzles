#!/usr/bin/ruby

def runProg (line, credit, count) 

 index1=1; index2=1; found=false;

 list = line.split(" ");

 list.each { |elem1|
  index2=1;
  list.each { |elem2|
   if(index1 != index2)
    total = elem1.to_i + elem2.to_i;
   end
   if (total == credit)
    found=true
    break
   elif
   end
   index2 = index2 + 1;
  }
  if (found == true) 
   break
  end
  index1 = index1 + 1;
 }
 [index1, index2]
end
fn = ARGV[0]
fh = File.open(fn)

index=0; count=0; credit=0; tcCount=0; caseNum=1;
fh.each { |line|

 if (index == 0)
  tcCount = line.to_i;
  #puts "Processing #{tcCount} test cases";
 end
 if (index == 1) 
  credit = line.to_i;
 end
 if (index == 2)
  count  = line.to_i;
 end
 if (index == 3) 
  o1, o2=runProg(line, credit, count);
  puts "Case \##{caseNum}: #{o1} #{o2}"; 
  index = 0; 
  caseNum = caseNum + 1;
 end 

 index = index + 1;

}

