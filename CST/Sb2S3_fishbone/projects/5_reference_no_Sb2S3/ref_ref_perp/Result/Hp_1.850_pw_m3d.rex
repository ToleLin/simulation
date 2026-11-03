<?xml version="1.0" encoding="UTF-8"?>
<MetaResultFile version="20211011" creator="Solver HFTD - Field 3DFD Monitor">
  <MetaGeometryFile filename="model.gex" lod="1"/>
  <SimulationProperties fieldname="Hp_1.850 [pw]" frequency="162.04997700000001" encoded_unit="&amp;U:A^1.:m^-1" quantity="h-field" fieldtype="H-Field" fieldscaling="PEAK" dB_Amplitude="20"/>
  <ResultDataType vector="1" complex="1" timedomain="0" frequencymap="0"/>
  <SimulationDomain min="-11 -0.385825008 -0.5" max="11 0.385825008 3.00999999"/>
  <PlotSettings Plot="4" ignore_symmetry="0" deformation="0" enforce_culling="0" integer_values="0" combine="CombineNone" default_arrow_type="ARROWS" default_scaling="NONE"/>
  <Source type="SOLVER"/>
  <SpecialMaterials>
    <Background type="NORMAL"/>
    <Material name="PEC" type="FIELDFREE"/>
  </SpecialMaterials>
  <AuxGeometryFile/>
  <AuxResultFile filename="Hp_1.850_pw^res.axg" add_to_tree="0" default="0"/>
  <FieldFreeNodes/>
  <SurfaceFieldCoefficients/>
  <UnitCell/>
  <SubVolume min_pos="10 -0.385825008 -0.200000003" max_pos="10 0.385825008 3" min_index="439537" max_index="9568000" is_cropped="0" create_subvolume_map="1" sub_folder=""/>
  <Units/>
  <ProjectUnits>
    <Quantity name="length" unit="&amp;Uu:m^1"/>
    <Quantity name="frequency" unit="&amp;UT:Hz^1"/>
    <Quantity name="time" unit="&amp;Uf:s^1"/>
    <Quantity name="temperature" unit="&amp;U:Cel^1"/>
  </ProjectUnits>
  <TimeSampling/>
  <LocalAxes/>
  <MeshViewSettings/>
  <ResultGroups num_steps="1" transformation="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1" process_mesh_group="0">
    <SharedDataWith>
      <Result treepath="" rexname=""/>
    </SharedDataWith>
    <Frame index="0">
      <PortModeInfoFile/>
      <FieldResultFile filename="Hp_1.850_pw.m3d" type="m3d"/>
    </Frame>
  </ResultGroups>
  <AutoScale>
    <SmartScaling log_strength="1" log_anchor="0" log_anchor_type="0" db_range="40" phase="0"/>
  </AutoScale>
</MetaResultFile>
