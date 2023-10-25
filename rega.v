module  Areg ( Q3,Q2,Q1,Q0, D3,D2,D1,D0, clock, C1, C0);
    input   D3,D2,D1,D0, clock, C1,C0;
    output  Q3,Q2,Q1,Q0;
    reg Q3,Q2,Q1,Q0;

    parameter Load= 2'b00, Reset= 2'b01, Shift= 2'b10, Hold= 2'b11;

    always @( posedge clock)
    begin
        case ( {C1,C0} )
            Reset: begin
                {Q3, Q2, Q1, Q0} = 4'b0000;
            end
            Load : begin
                {Q3, Q2, Q1, Q0}= {D3, D2, D1, D0};
            end
            Shift: begin
                {Q3, Q2, Q1, Q0}= {Q3, Q3, Q2, Q1}; //shiftout bit is connected in netlist
            end
            Hold: begin
            end
        endcase
    end


endmodule