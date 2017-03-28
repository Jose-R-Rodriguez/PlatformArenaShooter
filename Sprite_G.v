module Sprite_G(
	input[11:0] address,
	output reg[5:0] data
	);
	
	reg[5:0] rom_content[0:4096];
	
	always@(address or rom_content)
	begin
		data=rom_content[address];
		data={data[2],data[2],data[1],data[1],data[0],data[0]};
	end
	initial begin
		$readmemh("character1highres.mif",rom_content,0,4096);
	end
endmodule