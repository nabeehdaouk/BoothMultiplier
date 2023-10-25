module Mreg ( Q3,Q2,Q1,Q0, D3,D2,D1,D0, clock, C1);
    input   D3,D2,D1,D0, clock, C1;
    output Q3,Q2,Q1,Q0;

    reg Q3,Q2,Q1,Q0;

    parameter 	LD    = 1'b1 , HD    = 1'b0;


    always @( posedge clock)
    begin
        case ( C1 )
            LD: begin
                {Q3, Q2, Q1, Q0}= {D3, D2, D1, D0};
            end
            HD: begin
            end
        endcase

    end
endmodule
