module matrix (
    input [15:0] A[1:0][1:0],   // 2x2矩阵A, 16位每个元素
    input [15:0] B[1:0][1:0],   // 2x2矩阵B, 16位每个元素
    output [15:0] C[1:0][1:0]  // 结果矩阵C, 16位每个元素
);

    assign C[0][0] = A[0][0] + B[0][0];
    assign C[0][1] = A[0][1] + B[0][1];
    assign C[1][0] = A[1][0] + B[1][0];
    assign C[1][1] = A[1][1] + B[1][1];

endmodule
