//
// Copyright 2011 Ettus Research LLC
// Copyright 2018 Ettus Research, a National Instruments Company
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//




module ram_2port
  #(parameter DWIDTH=32,
    parameter AWIDTH=9)
    (input clka,
     input ena,
     input wea,
     input [AWIDTH-1:0] addra,
     input [DWIDTH-1:0] dia,
     output reg [DWIDTH-1:0] doa = 'd0,

     input clkb,
     input enb,
     input web,
     input [AWIDTH-1:0] addrb,
     input [DWIDTH-1:0] dib,
     output reg [DWIDTH-1:0] dob = 'd0);

   reg [DWIDTH-1:0] ram [(1<<AWIDTH)-1:0];

   /*
   integer i;
   initial begin
     for (i=0;i<(1<<AWIDTH);i=i+1) begin
       ram[i] <= {DWIDTH{1'b0}};
     end
   end
   */

   always @(posedge clka) begin
      if (ena)
        begin
           if (wea)
             ram[addra] <= dia;
           doa <= ram[addra];
        end
   end
   always @(posedge clkb) begin
      if (enb)
        begin
           if (web)
             ram[addrb] <= dib;
           dob <= ram[addrb];
        end
   end
endmodule // ram_2port
