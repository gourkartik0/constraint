class seq_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 dist {3:/4, [5:8] :/ 7}; }
  constraint value2_c {value2 dist {3:=4, [5:8] := 7}; }

endclass

module constraint_example;
  seq_item item;
  
  initial begin
    item = new();
    
    repeat(15) begin
      item.randomize();
      $display("value1 (with :/) = %0d, value2 (with :=)= %0d", item.value1, item.value2);
    end
  end
endmodule



/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 27 06:46 2025
value = 61.5
value = 56.5
value = 59.5
value = 58.5
value = 55.5
value = 60.5
value = 62.5
value = 65.5
value = 57.5
value = 63.5
value = 64.5
value = 64.5
value = 58.5
value = 57.5
value = 62.5
           V C S   S i m u l a t i o n   R e p o r t 
*/
