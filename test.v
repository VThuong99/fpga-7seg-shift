module test(
	input CLOCK_50,
	input [1:0] SW,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	);
	
reg [25:0] counter;
wire speed;
reg [2:0] shift;

	always @(posedge CLOCK_50)
		counter <= counter + 1'b1;
	
	assign speed = (SW[1] == 1'b0) ? counter[25]: counter[22];
	
	always @(posedge speed)
		if(SW[0])
			shift <= (shift == 3'b101 ) ? 0:shift + 1'b1;
		else 
			shift <= (shift == 3'b000) ? 5:shift - 1'b1;
			
	assign HEX0 = (shift == 3'b010) ? 7'b0000100:					//số 9
						(shift == 3'b011) ? 7'b0100100:					//số 5
						(shift == 3'b100) ? 7'b0000001:					//số 0 
						(shift == 3'b101) ? 7'b0000001: 7'b1111111;	
	assign HEX1 = (shift == 3'b001) ? 7'b0000100:
						(shift == 3'b010) ? 7'b0100100:
						(shift == 3'b011) ? 7'b0000001:
						(shift == 3'b100) ? 7'b0000001: 7'b1111111;
	assign HEX2 = (shift == 3'b000) ? 7'b0000100:
						(shift == 3'b001) ? 7'b0100100:
						(shift == 3'b010) ? 7'b0000001:
						(shift == 3'b011) ? 7'b0000001: 7'b1111111;
	assign HEX3 = (shift == 3'b101) ? 7'b0000100:
						(shift == 3'b000) ? 7'b0100100:
						(shift == 3'b001) ? 7'b0000001:
						(shift == 3'b010) ? 7'b0000001: 7'b1111111;
	assign HEX4 = (shift == 3'b100) ? 7'b0000100:
						(shift == 3'b101) ? 7'b0100100:
						(shift == 3'b000) ? 7'b0000001:
						(shift == 3'b001) ? 7'b0000001: 7'b1111111;
	assign HEX5 = (shift == 3'b011) ? 7'b0000100:
						(shift == 3'b100) ? 7'b0100100:
						(shift == 3'b101) ? 7'b0000001:
						(shift == 3'b000) ? 7'b0000001: 7'b1111111;
						
endmodule

//Bai6_Cau1
//module test (CLOCK_50, ledr);
//input CLOCK_50; 
//output reg [9:0] ledr = 10'b1; // Khởi tạo led đầu tiên sáng 
//reg [24:0] counter; 
//	 
//	always @(posedge CLOCK_50) 
//		counter <= counter + 1'b1; 
//	always @(posedge counter[24] )
//		ledr <= {ledr[8:0], ledr[9]}; // Dịch led từ phải sang trái 
// 
//endmodule 

////Bai6_Cau2
//module test (CLOCK_50, ledr);
//input CLOCK_50; 
//output reg [9:0] ledr = 10'b10000_00001; // Khởi tạo led đầu tiên sáng 
//reg [24:0] counter; 
// 
//	always @(posedge CLOCK_50) 
//		counter <= counter + 1'b1; 
//	always @(posedge counter[24])
//		// Dịch led từ ngoài vào giữa 
//		ledr <= {ledr[5], ledr[9:6], ledr[3:0], ledr[4]};
// 
//endmodule 

//Bai6_Cau3
//module test (CLOCK_50, ledr, SW); 
//input CLOCK_50; 
//input [1:0] SW; 
//output reg [9:0] ledr = 10'b1; 
// 
//reg [24:0] counter; 
//reg lr = 1'b0; 
//reg speed, speed_lr; 
// 
//always @(posedge CLOCK_50) 
//begin 
//counter <= counter + 1'b1; 
//speed <= (SW == 2'b00) ? counter[24]: 
//(SW == 2'b01) ? counter[23]: 
//(SW == 2'b10) ? counter[22]: 
//(SW == 2'b11) ? counter[21] : 1'b0; 
// 
////  Tạo ra một biến speed_lr có tốc độ nhanh hơn tốc độ 
//// dịch led để xác định khi nào dội lại 
//speed_lr <= (SW == 2'b00) ? counter[23]: 
//(SW == 2'b01) ? counter[22]: 
//(SW == 2'b10) ? counter[21]: 
//(SW == 2'b11) ? counter[20] : 1'b0; 
//end 
// 
//always @(posedge speed) 
//// Nếu sáng tới led cuối cùng thì dịch phải 
//// Nếu sáng tới led đầu tiên thì dịch trái 
//if (lr) 
//ledr <= {ledr[0], ledr[9:1]}; 
//else  
//ledr <= {ledr[8:0], ledr[9]}; 
// 
//always @(posedge speed_lr) 
//// Nếu led đầu tiên sáng thì đặt cờ lr = 1'b0 
//// Nếu led cuối cùng sáng thì đặt cờ lr = 1'b1 
//if (ledr == 10'b1)  
//lr <= 1'b0; 
//else if (ledr == 10'b10000_00000)  
//lr <= 1'b1; 
// 
//endmodule 

//Baocao_Cau1
//module test(
//		input [2:0]KEY,
//		input [7:0]SW,
//		output LED0
//		);
//
//	assign LED0 = SW[KEY];
//endmodule

//Baocao_Cau2

	
