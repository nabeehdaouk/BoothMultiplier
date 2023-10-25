module FSM_control_tb;
    reg 		clock, // System Clock
    Qm1, Q0, // previous and current lowest bit of Q
    start, // askink to start multiplying
    reset; // Reset initial states
    wire 		LM, // Register M control = 0 M Holds 1 M Loads
    LA0,LA1, // Register A control
    LQ0,LQ1, // Register Q control 
    AS, // AddSub control (0=add 1=sub)
    done; // Done=0 indicated working, 1 otherwise




    FSM_control UUT ( LM, LA0,LA1,LQ0,LQ1, Qm1, Q0, AS, reset, start, done, clock);
    initial begin
        clock= 1'b0;
        Qm1= 1'b0;
        Q0= 1'b0;
        start= 1'b0;
        clock= 1'b0;
        reset= 1'b0;

    end

    always
    begin
        start= 1'b0;
        reset= 1'b0;
        {Q0,Qm1}= 2'b00;
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        start= 1'b1;

        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        {Q0,Qm1}= 2'b00;
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        {Q0,Qm1}= 2'b01;
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        {Q0,Qm1}= 2'b10;
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        {Q0,Qm1}= 2'b11;
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);
        #10	$display($time,,,"RegM: %b   RegA:%b   RegQ:%b  Add/Sub:%b   Done:%b   INPUTS: Start=%b   Reset=%b   Q0=%b   Qm1=%b",
            LM, {LA1, LA0}, {LQ1, LQ0}, AS, done, start, reset, Q0, Qm1);





    end

    always #5 clock = ~clock;
endmodule


