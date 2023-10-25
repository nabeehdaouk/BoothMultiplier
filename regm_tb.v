module Mreg_tb;

    reg D3, D2, D1, D0, clock, C1;
    wire Q3, Q2, Q1, Q0;

    Mreg UUT (Q3, Q2, Q1, Q0, D3, D2, D1, D0, clock, C1);

    parameter 	LD    = 1'b1 , HD    = 1'b0;

    initial begin

        // Innitial Setup
        {D3, D2, D1, D0}= 4'b0000;

        clock = 0;

        // Wait for some time to allow for setup
        #10;

        // Test Hold mode

        $display("Testing Load mode:");
        C1= LD;



        {D3, D2, D1, D0}= 4'b1010;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        #10	$display($time,,,  "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});




        #1	$display($time,,, "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        {D3, D2, D1, D0}= 4'b1111;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        #10	$display($time,,,  "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        $display("Testing Hold mode:");
        C1= HD;



        {D3, D2, D1, D0}= 4'b0000;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        #10	$display($time,,,  "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});


        {D3, D2, D1, D0}= 4'b1010;

        #1	$display($time,,, "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});

        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0=%b     INPUT VALUES(D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0}, {D3, D2, D1, D0});





        // Finish simulation
        #10;
        $finish;
    end

    // Clock generation
    always #5 clock = ~clock;

endmodule

