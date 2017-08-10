module project_test(clk, rst, load_input_board, usr_ip, id_input, pass_input, pass_load_board, pass_pound,mode_ip, allow, auth, guest,Switch ,mode, stop,  
mux1disp, mux2disp, mux3disp, mux4disp, mux5disp, Seg_Counter_Out, Seg_Alphabet_Outas, scd1display );

input clk, rst;
input load_input_board ,pass_load_board ,pass_pound;
input usr_ip, mode;
input [3:0] id_input,pass_input;
input [1:0] mode_ip;
input [5:0]Switch;

wire [15:0] id_output, q_uid;
wire [7:0] q_pwd;
wire user_allow,pass_allow,flag,wrong_pwd, timeout, timeout_100ms, timeout_1s, load_input, pass_load,  l_m, a_m, g_m;
wire [3:0] user_seg, count_1s;
wire [2:0]address_user;
wire [5:0]address_pass;
wire [6:0] count, Seg_Alphabet_Out,Seg_RAG_Out, rngdisplay, pregoutdisp , seg_usr, gtd2display, seg_pwd,scd2display, seg_uid,  gtd1display;

wire mode_selector; 

output allow, auth, guest, stop;
output [6:0] mux1disp, mux2disp, mux3disp, mux4disp, mux5disp, Seg_Counter_Out, Seg_Alphabet_Outas, scd1display;


//reg allow;

l_f_s_r_count_1ms l_f_s_r_count_1ms_top(clk,rst,timeout);
l_f_s_r_count100ms l_f_s_r_count100ms_top(clk, rst,count,timeout_100ms);
l_f_s_r_count1s l_f_s_r_count1s_top(clk, rst,count_1s, timeout_1s);

button_shaper button_uid_load(clk,rst, load_input_board, load_input);
user_selection user_selection_top(clk, rst, pass_load, usr_ip, auth, guest);

user_id user_id_top(clk, rst, auth, load_input, id_input, id_output, user_allow, user_seg);
user_id_controller user_id_controller_top(clk, rst, id_output, user_allow, q_uid, address_user, pass_allow);
user_id_file user_id_file_top(address_user, clk, q_uid);
blinking_sevenseg blinking_sevenseg_top(clk, rst, user_seg , timeout_1s, seg_uid);

button_shaper button_pwd_load(clk,rst, pass_load_board, pass_load);
PASS_ROM_controller_mod PASS_ROM_controller_mod_top(clk, rst, pass_allow, pass_input, pass_load, pass_pound, address_user,  q_pwd, address_pass, allow, flag, wrong_pwd);
ROM_pass ROM_pass_DUT(address_pass, clk, q_pwd);
uid_pwd_sevenseg uid_pwd_sevenseg_top(clk, rst, auth, timeout_1s, wrong_pwd, seg_usr, seg_pwd);

assign mode_selector=allow^guest;
mode_selection mode_selection_top(clk, rst,pass_load, mode_selector, mode_ip, l_m, a_m, g_m); 


Learning_Mode_Top lmode(clk,l_m,pass_pound,Switch,Seg_Alphabet_Out);
Project_Top amode(clk,a_m,load_input_board,Seg_RAG_Out,Seg_Counter_Out,Seg_Alphabet_Outas, pass_pound, Switch);
gamemode gmode(clk, g_m, load_input_board, mode, pass_pound, Switch, stop, gtd1display, gtd2display, rngdisplay, pregoutdisp, scd1display, scd2display);


mux21 mux1(allow,seg_usr,gtd2display , mux1disp);
mux21 mux2(allow, seg_pwd,scd2display, mux2disp );
mux21 mux3(allow, seg_uid, gtd1display, mux3disp);
mux21 mux5(g_m,Seg_RAG_Out,rngdisplay, mux4disp );
mux21 mux6(g_m,Seg_Alphabet_Out, pregoutdisp, mux5disp );


endmodule