/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "lib/byte_unstriping.v:7" *)
module UNSTRIPING_SYNTH(data_out, valid_out, lane_0, lane_1, valid_0, valid_1, clk_2f, clk_f);
  (* src = "lib/byte_unstriping.v:13" *)
  wire [31:0] _000_;
  (* src = "lib/byte_unstriping.v:13" *)
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  (* src = "lib/byte_unstriping.v:11" *)
  input clk_2f;
  (* src = "lib/byte_unstriping.v:11" *)
  input clk_f;
  (* src = "lib/byte_unstriping.v:8" *)
  output [31:0] data_out;
  (* src = "lib/byte_unstriping.v:10" *)
  input [31:0] lane_0;
  (* src = "lib/byte_unstriping.v:10" *)
  input [31:0] lane_1;
  (* src = "lib/byte_unstriping.v:11" *)
  input valid_0;
  (* src = "lib/byte_unstriping.v:11" *)
  input valid_1;
  (* src = "lib/byte_unstriping.v:9" *)
  output valid_out;
  NOT _072_ (
    .A(clk_f),
    .Y(_002_)
  );
  NOT _073_ (
    .A(valid_0),
    .Y(_003_)
  );
  NOT _074_ (
    .A(valid_1),
    .Y(_004_)
  );
  NOR _075_ (
    .A(clk_f),
    .B(_003_),
    .Y(_005_)
  );
  NAND _076_ (
    .A(lane_0[1]),
    .B(_005_),
    .Y(_006_)
  );
  NOR _077_ (
    .A(_002_),
    .B(_004_),
    .Y(_007_)
  );
  NAND _078_ (
    .A(lane_1[1]),
    .B(_007_),
    .Y(_008_)
  );
  NAND _079_ (
    .A(_006_),
    .B(_008_),
    .Y(_000_[1])
  );
  NAND _080_ (
    .A(lane_0[2]),
    .B(_005_),
    .Y(_009_)
  );
  NAND _081_ (
    .A(lane_1[2]),
    .B(_007_),
    .Y(_010_)
  );
  NAND _082_ (
    .A(_009_),
    .B(_010_),
    .Y(_000_[2])
  );
  NAND _083_ (
    .A(lane_0[3]),
    .B(_005_),
    .Y(_011_)
  );
  NAND _084_ (
    .A(lane_1[3]),
    .B(_007_),
    .Y(_012_)
  );
  NAND _085_ (
    .A(_011_),
    .B(_012_),
    .Y(_000_[3])
  );
  NAND _086_ (
    .A(lane_0[4]),
    .B(_005_),
    .Y(_013_)
  );
  NAND _087_ (
    .A(lane_1[4]),
    .B(_007_),
    .Y(_014_)
  );
  NAND _088_ (
    .A(_013_),
    .B(_014_),
    .Y(_000_[4])
  );
  NAND _089_ (
    .A(lane_0[5]),
    .B(_005_),
    .Y(_015_)
  );
  NAND _090_ (
    .A(lane_1[5]),
    .B(_007_),
    .Y(_016_)
  );
  NAND _091_ (
    .A(_015_),
    .B(_016_),
    .Y(_000_[5])
  );
  NAND _092_ (
    .A(lane_0[6]),
    .B(_005_),
    .Y(_017_)
  );
  NAND _093_ (
    .A(lane_1[6]),
    .B(_007_),
    .Y(_018_)
  );
  NAND _094_ (
    .A(_017_),
    .B(_018_),
    .Y(_000_[6])
  );
  NAND _095_ (
    .A(lane_0[7]),
    .B(_005_),
    .Y(_019_)
  );
  NAND _096_ (
    .A(lane_1[7]),
    .B(_007_),
    .Y(_020_)
  );
  NAND _097_ (
    .A(_019_),
    .B(_020_),
    .Y(_000_[7])
  );
  NAND _098_ (
    .A(lane_0[8]),
    .B(_005_),
    .Y(_021_)
  );
  NAND _099_ (
    .A(lane_1[8]),
    .B(_007_),
    .Y(_022_)
  );
  NAND _100_ (
    .A(_021_),
    .B(_022_),
    .Y(_000_[8])
  );
  NAND _101_ (
    .A(lane_0[9]),
    .B(_005_),
    .Y(_023_)
  );
  NAND _102_ (
    .A(lane_1[9]),
    .B(_007_),
    .Y(_024_)
  );
  NAND _103_ (
    .A(_023_),
    .B(_024_),
    .Y(_000_[9])
  );
  NAND _104_ (
    .A(lane_0[10]),
    .B(_005_),
    .Y(_025_)
  );
  NAND _105_ (
    .A(lane_1[10]),
    .B(_007_),
    .Y(_026_)
  );
  NAND _106_ (
    .A(_025_),
    .B(_026_),
    .Y(_000_[10])
  );
  NAND _107_ (
    .A(lane_0[11]),
    .B(_005_),
    .Y(_027_)
  );
  NAND _108_ (
    .A(lane_1[11]),
    .B(_007_),
    .Y(_028_)
  );
  NAND _109_ (
    .A(_027_),
    .B(_028_),
    .Y(_000_[11])
  );
  NAND _110_ (
    .A(lane_0[12]),
    .B(_005_),
    .Y(_029_)
  );
  NAND _111_ (
    .A(lane_1[12]),
    .B(_007_),
    .Y(_030_)
  );
  NAND _112_ (
    .A(_029_),
    .B(_030_),
    .Y(_000_[12])
  );
  NAND _113_ (
    .A(lane_0[13]),
    .B(_005_),
    .Y(_031_)
  );
  NAND _114_ (
    .A(lane_1[13]),
    .B(_007_),
    .Y(_032_)
  );
  NAND _115_ (
    .A(_031_),
    .B(_032_),
    .Y(_000_[13])
  );
  NAND _116_ (
    .A(lane_0[14]),
    .B(_005_),
    .Y(_033_)
  );
  NAND _117_ (
    .A(lane_1[14]),
    .B(_007_),
    .Y(_034_)
  );
  NAND _118_ (
    .A(_033_),
    .B(_034_),
    .Y(_000_[14])
  );
  NAND _119_ (
    .A(lane_0[15]),
    .B(_005_),
    .Y(_035_)
  );
  NAND _120_ (
    .A(lane_1[15]),
    .B(_007_),
    .Y(_036_)
  );
  NAND _121_ (
    .A(_035_),
    .B(_036_),
    .Y(_000_[15])
  );
  NAND _122_ (
    .A(lane_0[16]),
    .B(_005_),
    .Y(_037_)
  );
  NAND _123_ (
    .A(lane_1[16]),
    .B(_007_),
    .Y(_038_)
  );
  NAND _124_ (
    .A(_037_),
    .B(_038_),
    .Y(_000_[16])
  );
  NAND _125_ (
    .A(lane_0[17]),
    .B(_005_),
    .Y(_039_)
  );
  NAND _126_ (
    .A(lane_1[17]),
    .B(_007_),
    .Y(_040_)
  );
  NAND _127_ (
    .A(_039_),
    .B(_040_),
    .Y(_000_[17])
  );
  NAND _128_ (
    .A(lane_0[18]),
    .B(_005_),
    .Y(_041_)
  );
  NAND _129_ (
    .A(lane_1[18]),
    .B(_007_),
    .Y(_042_)
  );
  NAND _130_ (
    .A(_041_),
    .B(_042_),
    .Y(_000_[18])
  );
  NAND _131_ (
    .A(lane_0[19]),
    .B(_005_),
    .Y(_043_)
  );
  NAND _132_ (
    .A(lane_1[19]),
    .B(_007_),
    .Y(_044_)
  );
  NAND _133_ (
    .A(_043_),
    .B(_044_),
    .Y(_000_[19])
  );
  NAND _134_ (
    .A(lane_0[20]),
    .B(_005_),
    .Y(_045_)
  );
  NAND _135_ (
    .A(lane_1[20]),
    .B(_007_),
    .Y(_046_)
  );
  NAND _136_ (
    .A(_045_),
    .B(_046_),
    .Y(_000_[20])
  );
  NAND _137_ (
    .A(lane_0[21]),
    .B(_005_),
    .Y(_047_)
  );
  NAND _138_ (
    .A(lane_1[21]),
    .B(_007_),
    .Y(_048_)
  );
  NAND _139_ (
    .A(_047_),
    .B(_048_),
    .Y(_000_[21])
  );
  NAND _140_ (
    .A(lane_0[22]),
    .B(_005_),
    .Y(_049_)
  );
  NAND _141_ (
    .A(lane_1[22]),
    .B(_007_),
    .Y(_050_)
  );
  NAND _142_ (
    .A(_049_),
    .B(_050_),
    .Y(_000_[22])
  );
  NAND _143_ (
    .A(lane_0[23]),
    .B(_005_),
    .Y(_051_)
  );
  NAND _144_ (
    .A(lane_1[23]),
    .B(_007_),
    .Y(_052_)
  );
  NAND _145_ (
    .A(_051_),
    .B(_052_),
    .Y(_000_[23])
  );
  NAND _146_ (
    .A(lane_0[24]),
    .B(_005_),
    .Y(_053_)
  );
  NAND _147_ (
    .A(lane_1[24]),
    .B(_007_),
    .Y(_054_)
  );
  NAND _148_ (
    .A(_053_),
    .B(_054_),
    .Y(_000_[24])
  );
  NAND _149_ (
    .A(lane_0[25]),
    .B(_005_),
    .Y(_055_)
  );
  NAND _150_ (
    .A(lane_1[25]),
    .B(_007_),
    .Y(_056_)
  );
  NAND _151_ (
    .A(_055_),
    .B(_056_),
    .Y(_000_[25])
  );
  NAND _152_ (
    .A(lane_0[26]),
    .B(_005_),
    .Y(_057_)
  );
  NAND _153_ (
    .A(lane_1[26]),
    .B(_007_),
    .Y(_058_)
  );
  NAND _154_ (
    .A(_057_),
    .B(_058_),
    .Y(_000_[26])
  );
  NAND _155_ (
    .A(lane_0[27]),
    .B(_005_),
    .Y(_059_)
  );
  NAND _156_ (
    .A(lane_1[27]),
    .B(_007_),
    .Y(_060_)
  );
  NAND _157_ (
    .A(_059_),
    .B(_060_),
    .Y(_000_[27])
  );
  NAND _158_ (
    .A(lane_0[28]),
    .B(_005_),
    .Y(_061_)
  );
  NAND _159_ (
    .A(lane_1[28]),
    .B(_007_),
    .Y(_062_)
  );
  NAND _160_ (
    .A(_061_),
    .B(_062_),
    .Y(_000_[28])
  );
  NAND _161_ (
    .A(lane_0[29]),
    .B(_005_),
    .Y(_063_)
  );
  NAND _162_ (
    .A(lane_1[29]),
    .B(_007_),
    .Y(_064_)
  );
  NAND _163_ (
    .A(_063_),
    .B(_064_),
    .Y(_000_[29])
  );
  NAND _164_ (
    .A(lane_0[30]),
    .B(_005_),
    .Y(_065_)
  );
  NAND _165_ (
    .A(lane_1[30]),
    .B(_007_),
    .Y(_066_)
  );
  NAND _166_ (
    .A(_065_),
    .B(_066_),
    .Y(_000_[30])
  );
  NAND _167_ (
    .A(lane_0[31]),
    .B(_005_),
    .Y(_067_)
  );
  NAND _168_ (
    .A(lane_1[31]),
    .B(_007_),
    .Y(_068_)
  );
  NAND _169_ (
    .A(_067_),
    .B(_068_),
    .Y(_000_[31])
  );
  NOR _170_ (
    .A(_005_),
    .B(_007_),
    .Y(_069_)
  );
  NOT _171_ (
    .A(_069_),
    .Y(_001_)
  );
  NAND _172_ (
    .A(lane_0[0]),
    .B(_005_),
    .Y(_070_)
  );
  NAND _173_ (
    .A(lane_1[0]),
    .B(_007_),
    .Y(_071_)
  );
  NAND _174_ (
    .A(_070_),
    .B(_071_),
    .Y(_000_[0])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _175_ (
    .C(clk_2f),
    .D(_001_),
    .Q(valid_out)
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _176_ (
    .C(clk_2f),
    .D(_000_[0]),
    .Q(data_out[0])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _177_ (
    .C(clk_2f),
    .D(_000_[1]),
    .Q(data_out[1])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _178_ (
    .C(clk_2f),
    .D(_000_[2]),
    .Q(data_out[2])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _179_ (
    .C(clk_2f),
    .D(_000_[3]),
    .Q(data_out[3])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _180_ (
    .C(clk_2f),
    .D(_000_[4]),
    .Q(data_out[4])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _181_ (
    .C(clk_2f),
    .D(_000_[5]),
    .Q(data_out[5])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _182_ (
    .C(clk_2f),
    .D(_000_[6]),
    .Q(data_out[6])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _183_ (
    .C(clk_2f),
    .D(_000_[7]),
    .Q(data_out[7])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _184_ (
    .C(clk_2f),
    .D(_000_[8]),
    .Q(data_out[8])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _185_ (
    .C(clk_2f),
    .D(_000_[9]),
    .Q(data_out[9])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _186_ (
    .C(clk_2f),
    .D(_000_[10]),
    .Q(data_out[10])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _187_ (
    .C(clk_2f),
    .D(_000_[11]),
    .Q(data_out[11])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _188_ (
    .C(clk_2f),
    .D(_000_[12]),
    .Q(data_out[12])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _189_ (
    .C(clk_2f),
    .D(_000_[13]),
    .Q(data_out[13])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _190_ (
    .C(clk_2f),
    .D(_000_[14]),
    .Q(data_out[14])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _191_ (
    .C(clk_2f),
    .D(_000_[15]),
    .Q(data_out[15])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _192_ (
    .C(clk_2f),
    .D(_000_[16]),
    .Q(data_out[16])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _193_ (
    .C(clk_2f),
    .D(_000_[17]),
    .Q(data_out[17])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _194_ (
    .C(clk_2f),
    .D(_000_[18]),
    .Q(data_out[18])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _195_ (
    .C(clk_2f),
    .D(_000_[19]),
    .Q(data_out[19])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _196_ (
    .C(clk_2f),
    .D(_000_[20]),
    .Q(data_out[20])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _197_ (
    .C(clk_2f),
    .D(_000_[21]),
    .Q(data_out[21])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _198_ (
    .C(clk_2f),
    .D(_000_[22]),
    .Q(data_out[22])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _199_ (
    .C(clk_2f),
    .D(_000_[23]),
    .Q(data_out[23])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _200_ (
    .C(clk_2f),
    .D(_000_[24]),
    .Q(data_out[24])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _201_ (
    .C(clk_2f),
    .D(_000_[25]),
    .Q(data_out[25])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _202_ (
    .C(clk_2f),
    .D(_000_[26]),
    .Q(data_out[26])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _203_ (
    .C(clk_2f),
    .D(_000_[27]),
    .Q(data_out[27])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _204_ (
    .C(clk_2f),
    .D(_000_[28]),
    .Q(data_out[28])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _205_ (
    .C(clk_2f),
    .D(_000_[29]),
    .Q(data_out[29])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _206_ (
    .C(clk_2f),
    .D(_000_[30]),
    .Q(data_out[30])
  );
  (* src = "lib/byte_unstriping.v:13" *)
  DFF _207_ (
    .C(clk_2f),
    .D(_000_[31]),
    .Q(data_out[31])
  );
endmodule
