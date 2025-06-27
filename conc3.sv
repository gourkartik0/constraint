//Write a constraint with array size 5 to 10 values & the array values should be in ascending/descending order without using sort method & post randomization
class my;
  rand int unsigned a[];
  // rand bit [7:0] a[];
  rand bit accending;
  constraint c1{a.size() inside {[5:10]};}
  
  constraint c2{foreach(a[i]) {a[i]<200;}}
  
  constraint c3{foreach(a[i])
    if(i>0){
      if(accending) a[i]>=a[i-1];
      else a[i]<=a[i-1];
    }
    }
endclass
      
      module tb;
      my obj;
        initial begin
          my obj =new();
          repeat(2)begin
          obj.randomize();
            $display(" assending =%d , size=%0d",obj.accending, obj.a.size());
            foreach(obj.a[i])$display("a[%0d]=%0d",i,obj.a[i]);
          
        end
        end
      endmodule      

/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 27 07:43 2025
 assending =1 , size=5
a[0]=52
a[1]=92
a[2]=151
a[3]=160
a[4]=164
 assending =0 , size=6
a[0]=72
a[1]=59
a[2]=59
a[3]=56
a[4]=19
a[5]=7
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Fri Jun 27 07:43:43 2025
*/
