module FSM_control( LM, LA0,LA1,LQ0,LQ1, Qm1, Q0, AS, reset, start, done, clock);
    output  LM, // Register M control = 0 M Holds 1 M Loads
    LA0,LA1, // Register A control
    LQ0,LQ1, // Register Q control 
    AS, // AddSub control (0=add 1=sub)
    done; // Done=0 indicated working, 1 otherwise
    input 	clock, // System Clock
    Qm1, Q0, // previous and current lowest bit of Q
    start, // askink to start multiplying
    reset; // Reset initial states

    reg  	[1:0] Count;
    reg  	LM, LA0,LA1,LQ0,LQ1,AS, done;

    //internal FSM state declarations
    reg [1:0] NXT_ST; reg [1:0] fsm_PRES_STATE; reg [1:0] PREV_ST;
    initial fsm_PRES_STATE = 2'b00;
    reg [0:0] done_next_posedge; //Takes extra clock cycle for final answer to propigate since registers are on same CLK as FSM


    // state encodings
    parameter 	s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

    // Control Signal Encoding
    parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11,
    Add   = 1'b0 , Sub   = 1'b1 ,
    LD    = 1'b1 , HD    = 1'b0;

    //sequential part (FSM)
    always @(posedge clock)

    begin
        done= done_next_posedge;
        case (fsm_PRES_STATE)
            s0:
            if ( start == 1'b1 )
                begin
                    NXT_ST  <= s1;
                    PREV_ST <= s0;
                end
            else
                begin
                    NXT_ST <= s0;
                    PREV_ST <= s0;
                end
            s1:
            if (reset == 1'b1 )
                begin
                    NXT_ST <= s0;
                    PREV_ST<= s1;
                end
            else
                begin
                    NXT_ST <= s2;
                    PREV_ST <= s1;
                end
            s2:
            if (Count == 2'b00 | reset== 1'b1)
                begin
                    NXT_ST <= s0;
                    PREV_ST <= s2;
                end

            else
                begin
                    NXT_ST <= s1;
                    PREV_ST <= s2;
                end
        endcase
    end

    always @(NXT_ST)
    begin
        fsm_PRES_STATE = NXT_ST;
    end

    always @({PREV_ST, NXT_ST})
    begin
        case ({PREV_ST, NXT_ST})

            {s0, s0}:
            begin
                AS = Add; //Dont Care
                LM = HD;
                {LA1,LA0} = Hold;
                {LQ1,LQ0} = Hold;

            end

            {s1, s0}:
            begin
                AS = Add; //Dont Care
                LM = HD;
                {LA1,LA0} = Shift;
                {LQ1,LQ0} = Shift;
                done_next_posedge = 1'b1;
            end
            {s2, s0}:

            begin
                AS = Add; //Dont Care
                LM = HD;
                {LA1,LA0} = Shift;
                {LQ1,LQ0} = Shift;
                done_next_posedge = 1'b1;
            end

            {s0, s1}:
            begin
                LM = LD;
                {LA1,LA0} = Reset;
                {LQ1,LQ0} = Load;
                AS = Add; //Dont Care
                done_next_posedge = 1'b0;
                Count = 2'b11;
            end

            {s2, s1}:
            begin
                LM = HD;
                {LA1,LA0} = Shift;
                {LQ1,LQ0} = Shift;
                Count= Count - 1'b1;
                //AS = Add; //Dont Care
            end

            {s1, s2}:
            begin
                case ({Q0, Qm1})
                    2'b01:
                    begin
                        AS = Add;
                        LM = HD;
                        {LA1,LA0} = Load;
                        {LQ1,LQ0} = Hold;
                    end


                    2'b10:
                    begin
                        AS = Sub;
                        LM = HD;
                        {LA1,LA0} = Load;
                        {LQ1,LQ0} = Hold;
                    end


                    2'b00:
                    begin
                        LM = HD;
                        {LA1,LA0} = Hold;
                        {LQ1,LQ0} = Hold;
                        AS = Add; //Dont Care 
                    end


                    2'b11:
                    begin
                        LM = HD;
                        {LA1,LA0} = Hold;
                        {LQ1,LQ0} = Hold;
                        AS = Add; //Dont Care 
                    end
                endcase
            end
        endcase
    end



endmodule






