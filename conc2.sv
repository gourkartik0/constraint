class my_class;
  rand int val;
  randc int index;

  constraint val_range {
    index >= 0;
    index <= 5;
  }

  constraint val_mapping {
    if (index == 0) val == 25;
    else if (index == 1) val == 27;
    else if (index == 2) val == 30;
    else if (index == 3) val == 36;
    else if (index == 4) val == 40;
    else if (index == 5) val == 45;
  }
endclass
module tb;
  initial begin
    my_class obj = new();
    repeat (10) begin
      assert(obj.randomize());
      $display("val = %0d", obj.val);
    end
  end
endmodule

/*
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 27 07:06 2025
val = 30
val = 40
val = 45
val = 25
val = 27
val = 36
val = 40
val = 30
val = 36
val = 45
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.430 seconds;       Data structure size:   0.0Mb
Fri Jun 27 07:06:03 2025
*/
