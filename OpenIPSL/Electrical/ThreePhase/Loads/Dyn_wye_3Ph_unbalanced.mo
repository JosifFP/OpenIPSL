within OpenIPSL.Electrical.ThreePhase.Loads;
model Dyn_wye_3Ph_unbalanced "Variable unbalanced three-phase wye load"
  extends ThreePhaseComponent;
  import Modelica.Blocks.Interfaces.*;

  Modelica.Blocks.Interfaces.RealInput P_in[3] "external P [pu]" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-120,20},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-60,20},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Q_in[3] "external Q [pu]" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-120,-40},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-60,-60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  OpenIPSL.Interfaces.PwPin A annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={-4,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin B annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={46,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100},
        rotation=0),
      visible=true));
  OpenIPSL.Interfaces.PwPin C annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={96,70},
        rotation=0),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100},
        rotation=0),
      visible=true));
  parameter SI.ActivePower P0_a(displayUnit="MW") "Initial Active power"
    annotation (Dialog(group="Power flow"));
  parameter SI.ReactivePower Q0_a(displayUnit="Mvar") "Initial Reactive power"
    annotation (Dialog(group="Power flow"));
  parameter SI.ActivePower P0_b(displayUnit="MW") "Initial Active power"
    annotation (Dialog(group="Power flow"));
  parameter SI.ReactivePower Q0_b(displayUnit="Mvar") "Initial Reactive power"
    annotation (Dialog(group="Power flow"));
  parameter SI.ActivePower P0_c(displayUnit="MW") "Initial Active power"
    annotation (Dialog(group="Power flow"));
  parameter SI.ReactivePower Q0_c( displayUnit="Mvar") "Initial Reactive power"
    annotation (Dialog(group="Power flow"));

protected
  SI.ActivePower P_a(displayUnit="MW", start = P0_a)
    "Initial active power";
  SI.ReactivePower Q_a(displayUnit="Mvar", start = Q0_a)
    "Initial reactive power";
  SI.ActivePower P_b(displayUnit="MW", start = P0_b)
    "Initial active power";
  SI.ReactivePower Q_b(displayUnit="Mvar", start = Q0_b)
    "Initial reactive power";
  SI.ActivePower P_c(displayUnit="MW", start = P0_c)
    "Initial active power";
  SI.ReactivePower Q_c(displayUnit="Mvar", start = Q0_c)
    "Initial reactive power";

equation
  P_a = P_in[1] * S_p;
  P_b = P_in[2] * S_p;
  P_c = P_in[3] * S_p;
  Q_a = Q_in[1] * S_p;
  Q_b = Q_in[2] * S_p;
  Q_c = Q_in[3] * S_p;

  P_a = (A.vr*A.ir + A.vi*A.ii)*S_p;
  Q_a = (A.vi*A.ir - A.vr*A.ii)*S_p;
  P_b = (B.vr*B.ir + B.vi*B.ii)*S_p;
  Q_b = (B.vi*B.ir - B.vr*B.ii)*S_p;
  P_c = (C.vr*C.ir + C.vi*C.ii)*S_p;
  Q_c = (C.vi*C.ir - C.vr*C.ii)*S_p;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, initialScale=0.1),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Dynamic Load"),Text(
          origin={20,6},
          lineColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ Load")}),
    Documentation(info="<html>
<p>This is a three-phase wye load model that allows the user to vary the power consumed during the simulation.</p>
<p>The user needs to input the actives (<b><i>P0_a</i></b>, <b><i>P0_b</i></b>, and <b><i>P0_c</i></b>) and reactives (<b><i>Q0_a</i></b>, <b><i>Q0_b</i></b>, and <b><i>Q0_c</i></b>) powers consumed by each phase of the load. 
Since the values come from independent parameters, the model allows the representation of unbalanced loads. The model allows the load to be represented as constant power only.</p>
<p>In addition to that, the real inputs <b><i>P_in</b></i> and <b><i>Q_in</b></i> multiply the values of active and reactive power, respectively. 
This allows the load to vary its consumed power over time during the simulation. Note that, since active and reactive powers can vary independently, the load's power factor can also vary.
In addition, note that, since <b><i>P_in</b></i> and <b><i>Q_in</b></i> have a 3x1 dimension, <b><i>P0_a</i></b>, <b><i>P0_b</i></b>, <b><i>P0_c</i></b>, <b><i>Q0_a</i></b>, <b><i>Q0_b</i></b>, and <b><i>Q0_c</i></b> can vary idependently. 
This makes the load to be characterized as unbalanced.</p> 
</html>"));
end Dyn_wye_3Ph_unbalanced;
