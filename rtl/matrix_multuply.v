`timescale 1ns / 1ps

module matrix_operations(A,B,Result);

	input [35:0] A;  			// 行*列*数据位宽 3*3*4
	input [35:0] B;
	output [89:0] Result;		// 行*列*数据位宽 3*3*10，
	
	reg [71:0] Result;		 
	reg [3:0] A1 [0:2][0:2];
	reg [3:0] B1 [0:2][0:2];
	reg [9:0] Res1 [0:2][0:2];	 // 因为A和B相乘最大的值为15*15=225，所以数据位宽为225*3=10位（一行乘一列）
	
	integer i,j,k;
	
	always@ (A or B)
	begin
		// 一维矩阵转为二维矩阵
		{A1[0][0],A1[0][1],A1[0][2],A1[1][0],A1[1][1],A1[1][2],A1[2][0],A1[2][1],A1[2][2]} = A;
		{B1[0][0],B1[0][1],B1[0][2],B1[1][0],B1[1][1],B1[1][2],B1[2][0],B1[2][1],B1[2][2]} = B;
		{Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]} = 71'd0;
		
		i=0; j=0; k=0;
		
		for(i=0;i<3;i=i+1)
		begin
			for(j=0;j<3;j=j+1)
			begin
				for(k=0;k<3;k=k+1)
				begin
					Res1[i][j]=Res1[i][j]+ (A1[i][k]*B1[k][j]);
				end
			end
		end
		
		Result = {Res1[0][0],Res1[0][1],Res1[0][2],Res1[1][0],Res1[1][1],Res1[1][2],Res1[2][0],Res1[2][1],Res1[2][2]};
	end

endmodule
