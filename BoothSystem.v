module BoothSystem(
    output Done, P7, P6, P5, P4, P3, P2, P1, P0,
    input CLK, Start, Reset, A3, A2, A1, A0, B3, B2, B1, B0);

    wire M_Control, A1_Control, A0_Control, Q1_Control, Q0_Control, AS_Control, Qm1_Wire;
    wire [3:0] Multiplicand_Input= {A3, A2, A1, A0};
    wire [3:0] Multiplier_Input= {B3, B2, B1, B0};
    wire [3:0] Mreg_to_AS;
    wire [3:0] AS_to_Areg;
    //This is essentially a netlist connecting the modules
    FSM_control FSM_Component(
        .clock (CLK),
        .Qm1 (Qm1_Wire),
        .Q0 (P0),
        .start (Start),
        .reset(Reset),
        .LM (M_Control),
        .LA1 (A1_Control),
        .LA0 (A0_Control),
        .LQ1 (Q1_Control),
        .LQ0 (Q0_Control),
        .AS (AS_Control),
        .done (Done)
    );

    Mreg Mreg_Component(
        .Q3 (Mreg_to_AS[3]),
        .Q2 (Mreg_to_AS[2]),
        .Q1 (Mreg_to_AS[1]),
        .Q0 (Mreg_to_AS[0]),
        .D3 (Multiplicand_Input[3]),
        .D2 (Multiplicand_Input[2]),
        .D1 (Multiplicand_Input[1]),
        .D0 (Multiplicand_Input[0]),
        .clock(CLK),
        .C1(M_Control)
    );

    Areg Areg_Component(
        .Q3 (P7),
        .Q2 (P6),
        .Q1 (P5),
        .Q0 (P4),
        .D3 (AS_to_Areg[3]),
        .D2 (AS_to_Areg[2]),
        .D1 (AS_to_Areg[1]),
        .D0 (AS_to_Areg[0]),
        .clock(CLK),
        .C1(A1_Control),
        .C0(A0_Control)
    );

    Qreg Qreg_Component(
        .Q3 (P3),
        .Q2 (P2),
        .Q1 (P1),
        .Q0 (P0),
        .QM1 (Qm1_Wire),
        .SI (P4),
        .D3 (Multiplier_Input[3]),
        .D2 (Multiplier_Input[2]),
        .D1 (Multiplier_Input[1]),
        .D0 (Multiplier_Input[0]),
        .clock(CLK),
        .C1(Q1_Control),
        .C0(Q0_Control)
    );

    addsub addsub_Component(
        .a3(P7),
        .a2(P6),
        .a1(P5),
        .a0(P4),
        .b3(Mreg_to_AS[3]),
        .b2(Mreg_to_AS[2]),
        .b1(Mreg_to_AS[1]),
        .b0(Mreg_to_AS[0]),
        .control(AS_Control),
        .co(),
        .r3(AS_to_Areg[3]),
        .r2(AS_to_Areg[2]),
        .r1(AS_to_Areg[1]),
        .r0(AS_to_Areg[0])
    );

endmodule


