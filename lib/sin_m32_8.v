/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "32-8b.v:7" *)
module m32b_8_sint(clk_4f, data_strp, valid_strp, reset, data_32_8_sint, valid_32_8_sint);
  (* src = "32-8b.v:16" *)
  wire [7:0] _000_;
  (* src = "32-8b.v:16" *)
  wire [1:0] _001_;
  (* src = "32-8b.v:16" *)
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
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  (* src = "32-8b.v:7" *)
  input clk_4f;
  (* src = "32-8b.v:11" *)
  output [7:0] data_32_8_sint;
  (* src = "32-8b.v:8" *)
  input [31:0] data_strp;
  (* src = "32-8b.v:10" *)
  input reset;
  (* init = 2'h0 *)
  (* src = "32-8b.v:14" *)
  wire [1:0] selector;
  (* src = "32-8b.v:12" *)
  output valid_32_8_sint;
  (* src = "32-8b.v:9" *)
  input valid_strp;
  NOT _095_ (
    .A(selector[0]),
    .Y(_057_)
  );
  NOT _096_ (
    .A(selector[1]),
    .Y(_058_)
  );
  NOT _097_ (
    .A(data_strp[9]),
    .Y(_059_)
  );
  NOT _098_ (
    .A(data_strp[13]),
    .Y(_060_)
  );
  NOT _099_ (
    .A(data_strp[14]),
    .Y(_061_)
  );
  NAND _100_ (
    .A(valid_strp),
    .B(reset),
    .Y(_062_)
  );
  NOT _101_ (
    .A(_062_),
    .Y(_002_)
  );
  NOR _102_ (
    .A(selector[0]),
    .B(_062_),
    .Y(_001_[0])
  );
  NOR _103_ (
    .A(_057_),
    .B(_058_),
    .Y(_063_)
  );
  NAND _104_ (
    .A(selector[0]),
    .B(selector[1]),
    .Y(_064_)
  );
  NOR _105_ (
    .A(selector[0]),
    .B(selector[1]),
    .Y(_065_)
  );
  NAND _106_ (
    .A(_057_),
    .B(_058_),
    .Y(_066_)
  );
  NOR _107_ (
    .A(_062_),
    .B(_065_),
    .Y(_067_)
  );
  NAND _108_ (
    .A(_002_),
    .B(_066_),
    .Y(_068_)
  );
  NOR _109_ (
    .A(_063_),
    .B(_068_),
    .Y(_001_[1])
  );
  NOR _110_ (
    .A(_062_),
    .B(_066_),
    .Y(_069_)
  );
  NAND _111_ (
    .A(data_strp[24]),
    .B(_069_),
    .Y(_070_)
  );
  NAND _112_ (
    .A(data_strp[0]),
    .B(_063_),
    .Y(_071_)
  );
  NOR _113_ (
    .A(selector[0]),
    .B(_058_),
    .Y(_072_)
  );
  NAND _114_ (
    .A(data_strp[8]),
    .B(_072_),
    .Y(_073_)
  );
  NOT _115_ (
    .A(_073_),
    .Y(_074_)
  );
  NAND _116_ (
    .A(selector[0]),
    .B(_058_),
    .Y(_075_)
  );
  NAND _117_ (
    .A(_058_),
    .B(data_32_8_sint[0]),
    .Y(_076_)
  );
  NAND _118_ (
    .A(_075_),
    .B(_076_),
    .Y(_077_)
  );
  NOR _119_ (
    .A(_074_),
    .B(_077_),
    .Y(_078_)
  );
  NAND _120_ (
    .A(_071_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _121_ (
    .A(data_strp[16]),
    .B(_075_),
    .Y(_080_)
  );
  NOR _122_ (
    .A(_068_),
    .B(_080_),
    .Y(_081_)
  );
  NAND _123_ (
    .A(_079_),
    .B(_081_),
    .Y(_082_)
  );
  NAND _124_ (
    .A(_070_),
    .B(_082_),
    .Y(_000_[0])
  );
  NOR _125_ (
    .A(data_strp[1]),
    .B(_064_),
    .Y(_083_)
  );
  NOR _126_ (
    .A(_062_),
    .B(_083_),
    .Y(_084_)
  );
  NOT _127_ (
    .A(_084_),
    .Y(_085_)
  );
  NAND _128_ (
    .A(_059_),
    .B(_072_),
    .Y(_086_)
  );
  NOR _129_ (
    .A(data_strp[25]),
    .B(_066_),
    .Y(_087_)
  );
  NOR _130_ (
    .A(data_strp[17]),
    .B(_075_),
    .Y(_088_)
  );
  NOR _131_ (
    .A(_087_),
    .B(_088_),
    .Y(_089_)
  );
  NAND _132_ (
    .A(_086_),
    .B(_089_),
    .Y(_090_)
  );
  NOR _133_ (
    .A(_085_),
    .B(_090_),
    .Y(_000_[1])
  );
  NAND _134_ (
    .A(data_strp[26]),
    .B(_069_),
    .Y(_091_)
  );
  NAND _135_ (
    .A(data_strp[10]),
    .B(_072_),
    .Y(_092_)
  );
  NAND _136_ (
    .A(data_strp[2]),
    .B(_063_),
    .Y(_093_)
  );
  NAND _137_ (
    .A(_058_),
    .B(data_32_8_sint[2]),
    .Y(_094_)
  );
  NAND _138_ (
    .A(_092_),
    .B(_094_),
    .Y(_003_)
  );
  NAND _139_ (
    .A(_075_),
    .B(_093_),
    .Y(_004_)
  );
  NOR _140_ (
    .A(_003_),
    .B(_004_),
    .Y(_005_)
  );
  NOR _141_ (
    .A(selector[1]),
    .B(data_strp[18]),
    .Y(_006_)
  );
  NOR _142_ (
    .A(_005_),
    .B(_006_),
    .Y(_007_)
  );
  NAND _143_ (
    .A(_067_),
    .B(_007_),
    .Y(_008_)
  );
  NAND _144_ (
    .A(_091_),
    .B(_008_),
    .Y(_000_[2])
  );
  NAND _145_ (
    .A(data_strp[27]),
    .B(_069_),
    .Y(_009_)
  );
  NAND _146_ (
    .A(data_strp[11]),
    .B(_072_),
    .Y(_010_)
  );
  NOR _147_ (
    .A(selector[0]),
    .B(data_32_8_sint[3]),
    .Y(_011_)
  );
  NOR _148_ (
    .A(selector[1]),
    .B(_011_),
    .Y(_012_)
  );
  NAND _149_ (
    .A(data_strp[3]),
    .B(_063_),
    .Y(_013_)
  );
  NAND _150_ (
    .A(_010_),
    .B(_013_),
    .Y(_014_)
  );
  NOR _151_ (
    .A(_012_),
    .B(_014_),
    .Y(_015_)
  );
  NOR _152_ (
    .A(selector[1]),
    .B(data_strp[19]),
    .Y(_016_)
  );
  NOR _153_ (
    .A(_015_),
    .B(_016_),
    .Y(_017_)
  );
  NAND _154_ (
    .A(_067_),
    .B(_017_),
    .Y(_018_)
  );
  NAND _155_ (
    .A(_009_),
    .B(_018_),
    .Y(_000_[3])
  );
  NAND _156_ (
    .A(data_strp[28]),
    .B(_069_),
    .Y(_019_)
  );
  NOR _157_ (
    .A(selector[0]),
    .B(data_32_8_sint[4]),
    .Y(_020_)
  );
  NOR _158_ (
    .A(selector[1]),
    .B(_020_),
    .Y(_021_)
  );
  NAND _159_ (
    .A(data_strp[12]),
    .B(_072_),
    .Y(_022_)
  );
  NAND _160_ (
    .A(data_strp[4]),
    .B(_063_),
    .Y(_023_)
  );
  NAND _161_ (
    .A(_022_),
    .B(_023_),
    .Y(_024_)
  );
  NOR _162_ (
    .A(_021_),
    .B(_024_),
    .Y(_025_)
  );
  NOR _163_ (
    .A(selector[1]),
    .B(data_strp[20]),
    .Y(_026_)
  );
  NOR _164_ (
    .A(_025_),
    .B(_026_),
    .Y(_027_)
  );
  NAND _165_ (
    .A(_067_),
    .B(_027_),
    .Y(_028_)
  );
  NAND _166_ (
    .A(_019_),
    .B(_028_),
    .Y(_000_[4])
  );
  NOR _167_ (
    .A(data_strp[5]),
    .B(_064_),
    .Y(_029_)
  );
  NOR _168_ (
    .A(_062_),
    .B(_029_),
    .Y(_030_)
  );
  NOT _169_ (
    .A(_030_),
    .Y(_031_)
  );
  NAND _170_ (
    .A(_060_),
    .B(_072_),
    .Y(_032_)
  );
  NOR _171_ (
    .A(data_strp[29]),
    .B(_066_),
    .Y(_033_)
  );
  NOR _172_ (
    .A(data_strp[21]),
    .B(_075_),
    .Y(_034_)
  );
  NOR _173_ (
    .A(_033_),
    .B(_034_),
    .Y(_035_)
  );
  NAND _174_ (
    .A(_032_),
    .B(_035_),
    .Y(_036_)
  );
  NOR _175_ (
    .A(_031_),
    .B(_036_),
    .Y(_000_[5])
  );
  NOR _176_ (
    .A(data_strp[6]),
    .B(_064_),
    .Y(_037_)
  );
  NOR _177_ (
    .A(_062_),
    .B(_037_),
    .Y(_038_)
  );
  NOT _178_ (
    .A(_038_),
    .Y(_039_)
  );
  NAND _179_ (
    .A(_061_),
    .B(_072_),
    .Y(_040_)
  );
  NOR _180_ (
    .A(data_strp[30]),
    .B(_066_),
    .Y(_041_)
  );
  NOR _181_ (
    .A(data_strp[22]),
    .B(_075_),
    .Y(_042_)
  );
  NOR _182_ (
    .A(_041_),
    .B(_042_),
    .Y(_043_)
  );
  NAND _183_ (
    .A(_040_),
    .B(_043_),
    .Y(_044_)
  );
  NOR _184_ (
    .A(_039_),
    .B(_044_),
    .Y(_000_[6])
  );
  NOR _185_ (
    .A(selector[1]),
    .B(data_strp[23]),
    .Y(_045_)
  );
  NAND _186_ (
    .A(data_strp[7]),
    .B(_063_),
    .Y(_046_)
  );
  NAND _187_ (
    .A(data_strp[15]),
    .B(_072_),
    .Y(_047_)
  );
  NAND _188_ (
    .A(_058_),
    .B(data_32_8_sint[7]),
    .Y(_048_)
  );
  NAND _189_ (
    .A(_046_),
    .B(_048_),
    .Y(_049_)
  );
  NAND _190_ (
    .A(_075_),
    .B(_047_),
    .Y(_050_)
  );
  NOR _191_ (
    .A(_049_),
    .B(_050_),
    .Y(_051_)
  );
  NOR _192_ (
    .A(_045_),
    .B(_051_),
    .Y(_052_)
  );
  NOR _193_ (
    .A(_065_),
    .B(_052_),
    .Y(_053_)
  );
  NOR _194_ (
    .A(data_strp[31]),
    .B(_066_),
    .Y(_054_)
  );
  NOR _195_ (
    .A(_062_),
    .B(_054_),
    .Y(_055_)
  );
  NOT _196_ (
    .A(_055_),
    .Y(_056_)
  );
  NOR _197_ (
    .A(_053_),
    .B(_056_),
    .Y(_000_[7])
  );
  (* src = "32-8b.v:16" *)
  DFF _198_ (
    .C(clk_4f),
    .D(_000_[0]),
    .Q(data_32_8_sint[0])
  );
  (* src = "32-8b.v:16" *)
  DFF _199_ (
    .C(clk_4f),
    .D(_000_[1]),
    .Q(data_32_8_sint[1])
  );
  (* src = "32-8b.v:16" *)
  DFF _200_ (
    .C(clk_4f),
    .D(_000_[2]),
    .Q(data_32_8_sint[2])
  );
  (* src = "32-8b.v:16" *)
  DFF _201_ (
    .C(clk_4f),
    .D(_000_[3]),
    .Q(data_32_8_sint[3])
  );
  (* src = "32-8b.v:16" *)
  DFF _202_ (
    .C(clk_4f),
    .D(_000_[4]),
    .Q(data_32_8_sint[4])
  );
  (* src = "32-8b.v:16" *)
  DFF _203_ (
    .C(clk_4f),
    .D(_000_[5]),
    .Q(data_32_8_sint[5])
  );
  (* src = "32-8b.v:16" *)
  DFF _204_ (
    .C(clk_4f),
    .D(_000_[6]),
    .Q(data_32_8_sint[6])
  );
  (* src = "32-8b.v:16" *)
  DFF _205_ (
    .C(clk_4f),
    .D(_000_[7]),
    .Q(data_32_8_sint[7])
  );
  (* src = "32-8b.v:16" *)
  DFF _206_ (
    .C(clk_4f),
    .D(_002_),
    .Q(valid_32_8_sint)
  );
  (* src = "32-8b.v:16" *)
  DFF _207_ (
    .C(clk_4f),
    .D(_001_[0]),
    .Q(selector[0])
  );
  (* src = "32-8b.v:16" *)
  DFF _208_ (
    .C(clk_4f),
    .D(_001_[1]),
    .Q(selector[1])
  );
endmodule