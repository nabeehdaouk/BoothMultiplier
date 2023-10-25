
module addsub_tb;
    reg a3,a2,a1,a0,b3,b2,b1,b0,control;
    wire co,r3,r2,r1;

    parameter  Add   = 1'b0 , Sub   = 1'b1 ;



    addsub UUT (co,r3,r2,r1,r0,a3,a2,a1,a0,b3,b2,b1,b0,control); // @suppress "Positional port connections for an instance with more than 3 ports. Consider using named port connections instead" // @suppress "An implicit net wire logic was inferred for 'r0'"

    always
    begin
        control = Add;
        {a3,a2,a1,a0} = 4'b0101; {b3,b2,b1,b0} =4'b1010 ; //input at time=0 // @suppress "Multiple statements on this line. Split the statements over multiple lines to improve readability"

        #10	$display($time,,,"ADD A=%b +  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});

        {a3,a2,a1,a0} = 4'b1101; {b3,b2,b1,b0} =4'b1110 ; //input at time=10
        #10	$display($time,,,"ADD A=%b +  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});

        {a3,a2,a1,a0} = 4'b1111; {b3,b2,b1,b0} =4'b0110 ; //input at time=20
        #10	$display($time,,,"ADD A=%b +  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});

        control = Sub;
        {a3,a2,a1,a0} = 4'b1101; {b3,b2,b1,b0} =4'b1110 ; //input at time=30
        #10	$display($time,,,"SUB A=%b -  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});

        {a3,a2,a1,a0} = 4'b1111; {b3,b2,b1,b0} =4'b0110 ; //input at time=40
        #10	$display($time,,,"SUB A=%b -  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});

        {a3,a2,a1,a0} = 4'b0000; {b3,b2,b1,b0} =4'b0111 ; //input at time=40
        #10	$display($time,,,"SUB A=%b -  B=%b Co=%b  Result=%b",
            {a3,a2,a1,a0}, {b3,b2,b1,b0}, co, {r3,r2,r1,r0});


        #10	$finish();
    end
endmodule



