#!/usr/bin/ruby

def group (c) 

 kpg = Hash.new("")
 kpg["a"] = [2,1];
 kpg["b"] = [2,2];
 kpg["c"] = [2,3];

 kpg["d"] = [3,1];
 kpg["e"] = [3,2];
 kpg["f"] = [3,3];
  
 kpg["g"] = [4,1];
 kpg["h"] = [4,2];
 kpg["i"] = [4,3];

 kpg["j"] = [5,1];
 kpg["k"] = [5,2];
 kpg["l"] = [5,3];

 kpg["m"] = [6,1];
 kpg["n"] = [6,2];
 kpg["o"] = [6,3];

 kpg["p"] = [7,1];
 kpg["q"] = [7,2];
 kpg["r"] = [7,3];
 kpg["s"] = [7,4];

 kpg["t"] = [8,1];
 kpg["u"] = [8,2];
 kpg["v"] = [8,3];

 kpg["w"] = [9,1];
 kpg["x"] = [9,2];
 kpg["y"] = [9,3];
 kpg["z"] = [9,4];
  
 kpg[" "] = [0,1];

 kpg[""] = [-1,1];

 kpg["\n"] = [-2,0];
 
 a,b = kpg[c]
end

def rp(letter, rep)
o = "";
m = letter.to_s
rep.times { o = o + m } 
return o
end

def runProg (msg) 

 op = "";
 
 prev = ""
 msg.each_char { |c|
  y,t = group(c)
  yp,tp = group(prev)
  if (y == yp)
   op = op + " " + rp(y,t)
  else 
   op = op + rp(y,t)
  end
  prev = c
 }
 return op
end

fn = ARGV[0]
fh = File.open(fn)

index=0; tcCount=0; caseNum=1;
fh.each { |line|

 if (index == 0)
  tcCount = line.to_i;
  index = 1;
 else 
  o=runProg(line);
  puts "Case \##{caseNum}: #{o}"; 
  caseNum = caseNum + 1;
 end 
}

