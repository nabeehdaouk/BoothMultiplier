module BoothSystem_tb;
    reg 		CLK, Start, Reset, A3, A2, A1, A0, B3, B2, B1, B0;
    wire 		Done, P7, P6, P5, P4, P3, P2, P1, P0;




    BoothSystem UUT(Done, P7, P6, P5, P4, P3, P2, P1, P0, CLK, Start, Reset, A3, A2, A1, A0, B3, B2, B1, B0);


    initial begin
        CLK= 1'b1;
        Start= 1'b1;
        Reset= 1'b0;

        $display("Testing Multiplication Functionality Below:");
        $display("NOTE* These answers should be mathematicly correct");
        {A3, A2, A1, A0}= 4'b1011;
        {B3, B2, B1, B0}= 4'b0111;
        #95	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b0111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b0011;
        {B3, B2, B1, B0}= 4'b0001;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);
        {A3, A2, A1, A0}= 4'b0101;
        {B3, B2, B1, B0}= 4'b0011;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b1111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b0000;
        {B3, B2, B1, B0}= 4'b0111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1011;
        {B3, B2, B1, B0}= 4'b0001;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);
        {A3, A2, A1, A0}= 4'b0101;
        {B3, B2, B1, B0}= 4'b1011;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b0000;
        {B3, B2, B1, B0}= 4'b0000;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);


        $display("Testing Start (repeated previous test with Start= 0):");
        $display("NOTE* These answers NOT be mathematicly correct");
        Start= 1'b0;
        {A3, A2, A1, A0}= 4'b1011;
        {B3, B2, B1, B0}= 4'b0111;
        #95	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b0111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b0011;
        {B3, B2, B1, B0}= 4'b0001;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);
        {A3, A2, A1, A0}= 4'b0101;
        {B3, B2, B1, B0}= 4'b0011;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b1111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);


        $display("Testing Reset (repeated previous test with Reset= 1):");
        $display("NOTE* These answers should NOT be mathematicly correct");
        Reset= 1'b1;
        Start= 1'b1;
        {A3, A2, A1, A0}= 4'b1011;
        {B3, B2, B1, B0}= 4'b0111;
        #95	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b0111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b0011;
        {B3, B2, B1, B0}= 4'b0001;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);
        {A3, A2, A1, A0}= 4'b0101;
        {B3, B2, B1, B0}= 4'b0011;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);

        {A3, A2, A1, A0}= 4'b1111;
        {B3, B2, B1, B0}= 4'b1111;
        #90	$display($time,,,"Multiplicand: %b *  Multiplier:%b   =  Product:%b		Done=%b",
            {A3, A2, A1, A0}, {B3, B2, B1, B0}, {P7, P6, P5, P4, P3, P2, P1, P0}, Done);
    end

    always #5 CLK = ~CLK;

endmodule