module addsub(co,r3,r2,r1,r0,a3,a2,a1,a0,b3,b2,b1,b0,control);
    output co,r3,r2,r1,r0;
    input  a3,a2,a1,a0,b3,b2,b1,b0,control;

    assign
    {co,r3,r2,r1,r0}=control?{a3,a2,a1,a0}-{b3,b2,b1,b0}:{a3,a2,a1,a0}+{b3,b2,b1,b0};
endmodule
