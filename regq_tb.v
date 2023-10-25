module Qreg_tb;

    reg SI, D3, D2, D1, D0, clock, C1, C0;
    wire Q3, Q2, Q1, Q0, so;

    Qreg UUT (Q3, Q2, Q1, Q0, Qm1, SI, D3, D2, D1, D0, clock, C1, C0);

    parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;

    initial begin

        SI= 1'b1;
        clock = 0;

        // Wait for some time to allow for setup
        #10;

        // Test Hold mode

        $display("Testing Load mode:");
        {C1, C0}= Load;



        {D3, D2, D1, D0}= 4'b1111;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});

        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});




        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        {D3, D2, D1, D0}= 4'b1010;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        $display("Testing Hold mode:");
        {C1, C0}= Hold;



        {D3, D2, D1, D0}= 4'b1111;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});





        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});

        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});

        {C1, C0}= Shift;
        $display("Testing Shift mode:");
        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});
        SI= 1'b0;

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        $display("Testing Reset mode:");
        {C1, C0}= Reset;
        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});

        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});

        #1	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});


        #10	$display($time,,,   "REG VALUES(Q)_Q3Q2Q1Q0Qm1=%b  INPUT VALUES Shift In=%b   (D)_D3D2D1D0=%b",
            {Q3, Q2, Q1, Q0, Qm1},SI , {D3, D2, D1, D0});




        // Finish simulation
        #10;
        $finish;
    end

    // Clock generation
    always #5 clock = ~clock;

endmodule