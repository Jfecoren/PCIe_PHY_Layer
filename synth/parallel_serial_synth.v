/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "lib/paralelo_serial.v:1" *)
module paralelo_serial_synth(clk_4f, clk_32f, data_in, valid_in, reset, data_out);
  (* src = "lib/paralelo_serial.v:11" *)
  wire [7:0] _000_;
  (* src = "lib/paralelo_serial.v:19" *)
  wire _001_;
  (* src = "lib/paralelo_serial.v:19" *)
  wire [2:0] _002_;
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
  (* src = "lib/paralelo_serial.v:2" *)
  input clk_32f;
  (* src = "lib/paralelo_serial.v:1" *)
  input clk_4f;
  (* src = "lib/paralelo_serial.v:9" *)
  wire [7:0] data2send;
  (* src = "lib/paralelo_serial.v:3" *)
  input [7:0] data_in;
  (* src = "lib/paralelo_serial.v:6" *)
  output data_out;
  (* src = "lib/paralelo_serial.v:5" *)
  input reset;
  (* src = "lib/paralelo_serial.v:8" *)
  wire [2:0] selector;
  (* src = "lib/paralelo_serial.v:4" *)
  input valid_in;
  NOT _046_ (
    .A(reset),
    .Y(_003_)
  );
  NOT _047_ (
    .A(data_in[2]),
    .Y(_004_)
  );
  NOT _048_ (
    .A(data_in[3]),
    .Y(_005_)
  );
  NOT _049_ (
    .A(data_in[4]),
    .Y(_006_)
  );
  NOT _050_ (
    .A(data_in[5]),
    .Y(_007_)
  );
  NOT _051_ (
    .A(data_in[7]),
    .Y(_008_)
  );
  NOT _052_ (
    .A(selector[0]),
    .Y(_009_)
  );
  NOT _053_ (
    .A(selector[2]),
    .Y(_010_)
  );
  NOR _054_ (
    .A(_003_),
    .B(selector[0]),
    .Y(_002_[0])
  );
  NAND _055_ (
    .A(selector[0]),
    .B(selector[1]),
    .Y(_011_)
  );
  NOT _056_ (
    .A(_011_),
    .Y(_012_)
  );
  NOR _057_ (
    .A(selector[0]),
    .B(selector[1]),
    .Y(_013_)
  );
  NOT _058_ (
    .A(_013_),
    .Y(_014_)
  );
  NAND _059_ (
    .A(reset),
    .B(_014_),
    .Y(_015_)
  );
  NOR _060_ (
    .A(_012_),
    .B(_015_),
    .Y(_002_[1])
  );
  NOR _061_ (
    .A(_010_),
    .B(_011_),
    .Y(_016_)
  );
  NAND _062_ (
    .A(_010_),
    .B(_011_),
    .Y(_017_)
  );
  NAND _063_ (
    .A(reset),
    .B(_017_),
    .Y(_018_)
  );
  NOR _064_ (
    .A(_016_),
    .B(_018_),
    .Y(_002_[2])
  );
  NAND _065_ (
    .A(data_in[0]),
    .B(valid_in),
    .Y(_019_)
  );
  NOT _066_ (
    .A(_019_),
    .Y(_000_[0])
  );
  NAND _067_ (
    .A(valid_in),
    .B(data_in[1]),
    .Y(_020_)
  );
  NOT _068_ (
    .A(_020_),
    .Y(_000_[1])
  );
  NAND _069_ (
    .A(valid_in),
    .B(_004_),
    .Y(_000_[2])
  );
  NAND _070_ (
    .A(valid_in),
    .B(_005_),
    .Y(_000_[3])
  );
  NAND _071_ (
    .A(valid_in),
    .B(_006_),
    .Y(_000_[4])
  );
  NAND _072_ (
    .A(valid_in),
    .B(_007_),
    .Y(_000_[5])
  );
  NAND _073_ (
    .A(valid_in),
    .B(data_in[6]),
    .Y(_021_)
  );
  NOT _074_ (
    .A(_021_),
    .Y(_000_[6])
  );
  NAND _075_ (
    .A(valid_in),
    .B(_008_),
    .Y(_000_[7])
  );
  NAND _076_ (
    .A(data2send[0]),
    .B(selector[2]),
    .Y(_022_)
  );
  NAND _077_ (
    .A(data2send[4]),
    .B(_010_),
    .Y(_023_)
  );
  NAND _078_ (
    .A(_022_),
    .B(_023_),
    .Y(_024_)
  );
  NOR _079_ (
    .A(_011_),
    .B(_024_),
    .Y(_025_)
  );
  NOR _080_ (
    .A(_003_),
    .B(_025_),
    .Y(_026_)
  );
  NAND _081_ (
    .A(data2send[5]),
    .B(_010_),
    .Y(_027_)
  );
  NAND _082_ (
    .A(_009_),
    .B(selector[1]),
    .Y(_028_)
  );
  NAND _083_ (
    .A(data2send[1]),
    .B(selector[2]),
    .Y(_029_)
  );
  NAND _084_ (
    .A(_027_),
    .B(_029_),
    .Y(_030_)
  );
  NOR _085_ (
    .A(_028_),
    .B(_030_),
    .Y(_031_)
  );
  NAND _086_ (
    .A(data2send[6]),
    .B(_010_),
    .Y(_032_)
  );
  NAND _087_ (
    .A(data2send[2]),
    .B(selector[2]),
    .Y(_033_)
  );
  NAND _088_ (
    .A(selector[0]),
    .B(_033_),
    .Y(_034_)
  );
  NOR _089_ (
    .A(selector[1]),
    .B(_034_),
    .Y(_035_)
  );
  NAND _090_ (
    .A(_032_),
    .B(_035_),
    .Y(_036_)
  );
  NAND _091_ (
    .A(data2send[7]),
    .B(_010_),
    .Y(_037_)
  );
  NAND _092_ (
    .A(data2send[3]),
    .B(selector[2]),
    .Y(_038_)
  );
  NOT _093_ (
    .A(_038_),
    .Y(_039_)
  );
  NOR _094_ (
    .A(_014_),
    .B(_039_),
    .Y(_040_)
  );
  NAND _095_ (
    .A(_037_),
    .B(_040_),
    .Y(_041_)
  );
  NAND _096_ (
    .A(_036_),
    .B(_041_),
    .Y(_042_)
  );
  NOR _097_ (
    .A(_031_),
    .B(_042_),
    .Y(_043_)
  );
  NAND _098_ (
    .A(_026_),
    .B(_043_),
    .Y(_044_)
  );
  NAND _099_ (
    .A(_003_),
    .B(data_out),
    .Y(_045_)
  );
  NAND _100_ (
    .A(_044_),
    .B(_045_),
    .Y(_001_)
  );
  (* src = "lib/paralelo_serial.v:19" *)
  DFF _101_ (
    .C(clk_32f),
    .D(_002_[0]),
    .Q(selector[0])
  );
  (* src = "lib/paralelo_serial.v:19" *)
  DFF _102_ (
    .C(clk_32f),
    .D(_002_[1]),
    .Q(selector[1])
  );
  (* src = "lib/paralelo_serial.v:19" *)
  DFF _103_ (
    .C(clk_32f),
    .D(_002_[2]),
    .Q(selector[2])
  );
  (* src = "lib/paralelo_serial.v:19" *)
  DFF _104_ (
    .C(clk_32f),
    .D(_001_),
    .Q(data_out)
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _105_ (
    .C(clk_4f),
    .D(_000_[0]),
    .Q(data2send[0])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _106_ (
    .C(clk_4f),
    .D(_000_[1]),
    .Q(data2send[1])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _107_ (
    .C(clk_4f),
    .D(_000_[2]),
    .Q(data2send[2])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _108_ (
    .C(clk_4f),
    .D(_000_[3]),
    .Q(data2send[3])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _109_ (
    .C(clk_4f),
    .D(_000_[4]),
    .Q(data2send[4])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _110_ (
    .C(clk_4f),
    .D(_000_[5]),
    .Q(data2send[5])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _111_ (
    .C(clk_4f),
    .D(_000_[6]),
    .Q(data2send[6])
  );
  (* src = "lib/paralelo_serial.v:11" *)
  DFF _112_ (
    .C(clk_4f),
    .D(_000_[7]),
    .Q(data2send[7])
  );
endmodule
