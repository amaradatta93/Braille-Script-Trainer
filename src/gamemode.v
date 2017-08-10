 
module gamemode(clk, rst, btnin, mode, loadin, palphin, stop, gtd1display, gtd2display, rngdisplay, pregoutdisp, scd1display, scd2display);

input clk, rst, mode, loadin, btnin;
input [5:0]palphin;

output [6:0]pregoutdisp, rngdisplay, gtd1display, gtd2display, scd1display, scd2display;
output stop;

wire update, timeout2sec, reqlfsr, req2sec, allowgt, segen, loadout, allowsc, seg7en ;
wire [3:0]gtd1, gtd2, rngout, raout1, raout2, raout3, raout4, raout5, alph1, alph2, alph3, alph4, alph5, pdecout, pregout, scd1, scd2, winner;
wire [7:0]score;


btnshaper btnshaperupdate(clk, rst, btnin, update);
gamecontroller gctrl(clk, rst, mode, update, timeout2sec, rngout, reqlfsr, req2sec, allowgt, raout1, raout2, raout3, raout4, raout5, segen);
rngenerator rng(clk, rst, mode, reqlfsr, rngout);
timer2s t2s(clk, rst, req2sec, timeout2sec);
sort sortalph(allowgt, raout1, raout2, raout3, raout4, raout5, alph1, alph2, alph3, alph4, alph5);
seg7rndalph rndalph(rngout, rngdisplay, segen);

gametimer gtimer(clk, rst, allowgt, gtd1, gtd2, stop);
seg7nmbr seg7_gt1(gtd1, gtd1display);
seg7nmbr seg7_gt2(gtd2, gtd2display);


alphdecoder decoder(palphin, pdecout);
btnshaper btnshaperplayer(clk, rst, loadin, loadout);
pregister palph(pdecout, clk, rst, loadout, pregout);
seg7rndalph playeralph(pregout, pregoutdisp, seg7en);
accessctrl accessctrl_a(clk, rst, loadout, alph1, alph2, alph3, alph4, alph5, pdecout, allowsc, seg7en);


scorectrl sctrl(clk, rst, allowsc, scd1, scd2);
seg7nmbr seg7_sc1(scd1, scd1display);
seg7nmbr seg7_sc2(scd2, scd2display);

countersa countera(clk, rst, allowsc, score);
endmodule



