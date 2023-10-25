module Qreg ( Q3,Q2,Q1,Q0,QM1, SI, D3,D2,D1,D0, clock, C1, C0);
    input   SI, D3,D2,D1,D0, clock, C1,C0;
    output Q3,Q2,Q1,Q0,QM1;

    reg Q3,Q2,Q1,Q0,QM1;

    parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;

    always @( posedge clock)
    begin
        case ( {C1,C0} )
            Hold: begin
            end
            Reset: begin
                {Q3, Q2, Q1, Q0, QM1} = 5'b00000;
            end
            Load: begin
                {Q3, Q2, Q1, Q0}= {D3, D2, D1, D0};
                QM1= 1'b0;
            end
            Shift: begin
                {Q3, Q2, Q1, Q0, QM1} = {SI, Q3, Q2, Q1, Q0};
            end
        endcase
    end
endmodule
