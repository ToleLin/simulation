'# MWS Version: Version 2024.1 - Oct 16 2023 - ACIS 33.0.1 -

'# length = um
'# frequency = THz
'# time = fs
'# frequency range: fmin = 149.9 fmax = 299.8
'# created = '[VERSION]2024.1|33.0.1|20231016[/VERSION]


'@ units

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Units
    .Geometry "um"
    .Frequency "THz"
    .Time "fs"
End With

'@ materials

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Material
    .Reset
    .Name "Au_JC_Drude"
    .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "Hz", "m"
    .Epsilon "1"
    .Mu "1"
    .DispModelEps "Drude"
    .EpsInfinity "9.302828"
    .DispCoeff1Eps "1.358587e+16"
    .DispCoeff2Eps "1.118897e+14"
    .DispModelMu "None"
    .UseGeneralDispersionEps "False"
    .Colour "1", "0.8", "0"
    .Create
End With
With Material
    .Reset
    .Name "SiO2_n1444"
    .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "Hz", "m"
    .Epsilon "2.085136"
    .Mu "1"
    .Colour "0.75", "0.75", "0.75"
    .Create
End With

With Material
    .Reset
    .Name "Sb2S3_a"
    .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "Hz", "m"
    .Epsilon "1"
    .Mu "1"
    .DispModelEps "Lorentz"
    .EpsInfinity "1.000000"
    .DispCoeff1Eps "7.002600"
    .DispCoeff2Eps "4.746205e+15"
    .DispCoeff3Eps "1e10"
    .DispModelMu "None"
    .UseGeneralDispersionEps "False"
    .Colour "0.8", "0.1", "0.1"
    .Create
End With

With Material
    .Reset
    .Name "Sb2S3_c"
    .FrqType "all"
    .Type "Normal"
    .SetMaterialUnit "Hz", "m"
    .Epsilon "1"
    .Mu "1"
    .DispModelEps "Lorentz"
    .EpsInfinity "5.257900"
    .DispCoeff1Eps "10.426300"
    .DispCoeff2Eps "4.075583e+15"
    .DispCoeff3Eps "1e10"
    .DispModelMu "None"
    .UseGeneralDispersionEps "False"
    .Colour "0.1", "0.3", "0.9"
    .Create
End With

'@ substrate and gold film

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Brick
    .Reset
    .Name "SiO2"
    .Component "film"
    .Material "SiO2_n1444"
    .Xrange "-11.0", "11.0"
    .Yrange "-p/2", "p/2"
    .Zrange "-0.5", "-0.2"
    .Create
End With
With Brick
    .Reset
    .Name "Au"
    .Component "film"
    .Material "Au_JC_Drude"
    .Xrange "-11.0", "11.0"
    .Yrange "-p/2", "p/2"
    .Zrange "-0.2", "0"
    .Create
End With

'@ Sb2S3 bars (fishbone)

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Brick
    .Reset
    .Name "bar_m_top"
    .Component "bars"
    .Material "Sb2S3_a"
    .Xrange "(0)-(L)/2", "(0)+(L)/2"
    .Yrange "(p/2)-(W)/2", "(p/2)+(W)/2"
    .Zrange "0", "T"
    .Create
End With
With Transform
    .Reset
    .Name "bars:bar_m_top"
    .Origin "Free"
    .Center "0", "p/2", "0"
    .Angle "0", "0", "-45"
    .MultipleObjects "False"
    .GroupObjects "False"
    .Repetitions "1"
    .MultipleSelection "False"
    .Transform "Shape", "Rotate"
End With

With Brick
    .Reset
    .Name "cut_bar_m_top"
    .Component "bars"
    .Material "Sb2S3_a"
    .Xrange "-2", "2"
    .Yrange "-p/2", "p/2"
    .Zrange "0", "T"
    .Create
End With
Solid.Intersect "bars:bar_m_top", "bars:cut_bar_m_top"

With Brick
    .Reset
    .Name "bar_m_bot"
    .Component "bars"
    .Material "Sb2S3_a"
    .Xrange "(0)-(L)/2", "(0)+(L)/2"
    .Yrange "(-p/2)-(W)/2", "(-p/2)+(W)/2"
    .Zrange "0", "T"
    .Create
End With
With Transform
    .Reset
    .Name "bars:bar_m_bot"
    .Origin "Free"
    .Center "0", "-p/2", "0"
    .Angle "0", "0", "-45"
    .MultipleObjects "False"
    .GroupObjects "False"
    .Repetitions "1"
    .MultipleSelection "False"
    .Transform "Shape", "Rotate"
End With

With Brick
    .Reset
    .Name "cut_bar_m_bot"
    .Component "bars"
    .Material "Sb2S3_a"
    .Xrange "-2", "2"
    .Yrange "-p/2", "p/2"
    .Zrange "0", "T"
    .Create
End With
Solid.Intersect "bars:bar_m_bot", "bars:cut_bar_m_bot"

With Brick
    .Reset
    .Name "bar_p"
    .Component "bars"
    .Material "Sb2S3_a"
    .Xrange "(-dx)-(L)/2", "(-dx)+(L)/2"
    .Yrange "(0)-(W)/2", "(0)+(W)/2"
    .Zrange "0", "T"
    .Create
End With
With Transform
    .Reset
    .Name "bars:bar_p"
    .Origin "Free"
    .Center "-dx", "0", "0"
    .Angle "0", "0", "45"
    .MultipleObjects "False"
    .GroupObjects "False"
    .Repetitions "1"
    .MultipleSelection "False"
    .Transform "Shape", "Rotate"
End With

'@ mesh box

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Brick
    .Reset
    .Name "box"
    .Component "meshbox"
    .Material "Vacuum"
    .Xrange "-0.9", "0.5"
    .Yrange "-p/2", "p/2"
    .Zrange "T", "T+0.01"
    .Create
End With

'@ mesh

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Mesh
    .MeshType "PBA"
    .SetCreator "High Frequency"
End With
With MeshSettings
    .SetMeshType "Hex"
    .Set "Version", 1%
    .Set "StepsPerWaveNear", "20"
    .Set "StepsPerWaveFar", "20"
    .Set "WavelengthRefinementSameAsNear", "1"
    .Set "StepsPerBoxNear", "10"
    .Set "StepsPerBoxFar", "1"
End With
With MeshSettings
    With .ItemMeshSettings ("solid$meshbox:box")
        .SetMeshType "Hex"
        .Set "EdgeRefinement", "1"
        .Set "Extend", "0", "0", "0"
        .Set "Fixpoints", 1
        .Set "MeshType", "Default"
        .Set "NumSteps", "0", "0", "0"
        .Set "Priority", "0"
        .Set "RefinementPolicy", "ABS_VALUE"
        .Set "SnappingIntervals", 0, 0, 0
        .Set "SnappingPriority", 0
        .Set "SnapTo", "1", "1", "1"
        .Set "Step", "0.006", "0.006", "0.006"
        .Set "StepRatio", "0", "0", "0"
        .Set "StepRefinementCollectPolicy", "REFINE_ALL"
        .Set "StepRefinementExtentPolicy", "EXTENT_ABS_VALUE"
        .Set "UseDielectrics", 1
        .Set "UseEdgeRefinement", 1
        .Set "UseForRefinement", 1
        .Set "UseForSnapping", 1
        .Set "UseSameExtendXYZ", 1
        .Set "UseSameStepWidthXYZ", 1
        .Set "UseSnappingPriority", 0
        .Set "UseStepAndExtend", 1
        .Set "UseVolumeRefinement", 0
    End With
End With
With MeshSettings
    With .ItemMeshSettings ("solid$bars:bar_p")
        .SetMeshType "Hex"
        .Set "EdgeRefinement", "1"
        .Set "Extend", "0", "0", "0"
        .Set "Fixpoints", 1
        .Set "MeshType", "Default"
        .Set "NumSteps", "0", "0", "0"
        .Set "Priority", "0"
        .Set "RefinementPolicy", "ABS_VALUE"
        .Set "SnappingIntervals", 0, 0, 0
        .Set "SnappingPriority", 0
        .Set "SnapTo", "1", "1", "1"
        .Set "Step", "0.006", "0.006", "0.006"
        .Set "StepRatio", "0", "0", "0"
        .Set "StepRefinementCollectPolicy", "REFINE_ALL"
        .Set "StepRefinementExtentPolicy", "EXTENT_ABS_VALUE"
        .Set "UseDielectrics", 1
        .Set "UseEdgeRefinement", 1
        .Set "UseForRefinement", 1
        .Set "UseForSnapping", 1
        .Set "UseSameExtendXYZ", 1
        .Set "UseSameStepWidthXYZ", 1
        .Set "UseSnappingPriority", 0
        .Set "UseStepAndExtend", 1
        .Set "UseVolumeRefinement", 0
    End With
End With
With MeshSettings
    With .ItemMeshSettings ("solid$bars:bar_m_top")
        .SetMeshType "Hex"
        .Set "EdgeRefinement", "1"
        .Set "Extend", "0", "0", "0"
        .Set "Fixpoints", 1
        .Set "MeshType", "Default"
        .Set "NumSteps", "0", "0", "0"
        .Set "Priority", "0"
        .Set "RefinementPolicy", "ABS_VALUE"
        .Set "SnappingIntervals", 0, 0, 0
        .Set "SnappingPriority", 0
        .Set "SnapTo", "1", "1", "1"
        .Set "Step", "0.006", "0.006", "0.006"
        .Set "StepRatio", "0", "0", "0"
        .Set "StepRefinementCollectPolicy", "REFINE_ALL"
        .Set "StepRefinementExtentPolicy", "EXTENT_ABS_VALUE"
        .Set "UseDielectrics", 1
        .Set "UseEdgeRefinement", 1
        .Set "UseForRefinement", 1
        .Set "UseForSnapping", 1
        .Set "UseSameExtendXYZ", 1
        .Set "UseSameStepWidthXYZ", 1
        .Set "UseSnappingPriority", 0
        .Set "UseStepAndExtend", 1
        .Set "UseVolumeRefinement", 0
    End With
End With
With MeshSettings
    With .ItemMeshSettings ("solid$bars:bar_m_bot")
        .SetMeshType "Hex"
        .Set "EdgeRefinement", "1"
        .Set "Extend", "0", "0", "0"
        .Set "Fixpoints", 1
        .Set "MeshType", "Default"
        .Set "NumSteps", "0", "0", "0"
        .Set "Priority", "0"
        .Set "RefinementPolicy", "ABS_VALUE"
        .Set "SnappingIntervals", 0, 0, 0
        .Set "SnappingPriority", 0
        .Set "SnapTo", "1", "1", "1"
        .Set "Step", "0.006", "0.006", "0.006"
        .Set "StepRatio", "0", "0", "0"
        .Set "StepRefinementCollectPolicy", "REFINE_ALL"
        .Set "StepRefinementExtentPolicy", "EXTENT_ABS_VALUE"
        .Set "UseDielectrics", 1
        .Set "UseEdgeRefinement", 1
        .Set "UseForRefinement", 1
        .Set "UseForSnapping", 1
        .Set "UseSameExtendXYZ", 1
        .Set "UseSameStepWidthXYZ", 1
        .Set "UseSnappingPriority", 0
        .Set "UseStepAndExtend", 1
        .Set "UseVolumeRefinement", 0
    End With
End With
With MeshSettings
    With .ItemMeshSettings ("solid$film:SiO2")
        .SetMeshType "Hex"
        .Set "UseDielectrics", 0
        .Set "UseEdgeRefinement", 0
        .Set "UseForRefinement", 0
        .Set "UseForSnapping", 0
        .Set "UseStepAndExtend", 0
        .Set "UseVolumeRefinement", 0
    End With
End With

'@ boundaries

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Boundary
    .Xmin "open"
    .Xmax "open"
    .Ymin "periodic"
    .Ymax "periodic"
    .Zmin "open"
    .Zmax "expanded open"
    .Xsymmetry "none"
    .Ysymmetry "none"
    .Zsymmetry "none"
    .ApplyInAllDirections "False"
    .SetPeriodicBoundaryAngles "0.0", "0.0"
    .ReflectionLevel "0.0001"
    .MinimumDistanceType "Fraction"
    .MinimumDistanceReferenceFrequencyType "User"
    .FrequencyForMinimumDistance "149.9"
    .MinimumDistancePerWavelength "8"
End With
With Background
    .ResetBackground
    .Type "Normal"
    .Epsilon "1.0"
    .Mu "1.0"
    .ApplyInAllDirections "False"
    .XminSpace "0"
    .XmaxSpace "0"
    .YminSpace "0"
    .YmaxSpace "0"
    .ZminSpace "0"
    .ZmaxSpace "2.8"
End With

'@ plane wave

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With PlaneWave
    .Reset
    .Normal "0", "0", "-1"
    .EVector "pol_x", "pol_y", "0"
    .Polarization "Linear"
    .ReferenceFrequency "193.41"
    .PhaseDifference "-90.0"
    .CircularDirection "Left"
    .AxialRatio "0.0"
    .SetUserDecouplingPlane "False"
    .Store
End With

'@ monitors

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With Monitor
    .Reset
    .Name "Ep_1.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "299.792458"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "299.792458"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "299.792458"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "299.792458"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.025"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "292.480447"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.025"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "292.480447"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.025"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "292.480447"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.025"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "292.480447"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.050"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "285.516627"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.050"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "285.516627"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.050"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "285.516627"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.050"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "285.516627"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.075"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "278.876705"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.075"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "278.876705"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.075"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "278.876705"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.075"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "278.876705"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.100"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "272.538598"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.100"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "272.538598"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.100"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "272.538598"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.100"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "272.538598"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.125"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "266.482185"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.125"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "266.482185"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.125"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "266.482185"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.125"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "266.482185"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.150"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "260.689094"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.150"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "260.689094"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.150"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "260.689094"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.150"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "260.689094"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.175"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "255.142517"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.175"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "255.142517"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.175"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "255.142517"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.175"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "255.142517"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.200"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "249.827048"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.200"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "249.827048"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.200"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "249.827048"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.200"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "249.827048"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.225"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "244.728537"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.225"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "244.728537"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.225"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "244.728537"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.225"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "244.728537"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.250"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "239.833966"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.250"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "239.833966"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.250"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "239.833966"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.250"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "239.833966"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.275"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "235.131340"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.275"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "235.131340"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.275"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "235.131340"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.275"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "235.131340"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.300"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "230.609583"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.300"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "230.609583"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.300"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "230.609583"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.300"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "230.609583"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.325"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "226.258459"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.325"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "226.258459"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.325"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "226.258459"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.325"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "226.258459"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.350"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "222.068487"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.350"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "222.068487"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.350"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "222.068487"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.350"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "222.068487"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.375"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "218.030879"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.375"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "218.030879"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.375"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "218.030879"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.375"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "218.030879"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.400"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "214.137470"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.400"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "214.137470"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.400"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "214.137470"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.400"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "214.137470"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.425"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "210.380672"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.425"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "210.380672"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.425"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "210.380672"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.425"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "210.380672"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.450"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "206.753419"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.450"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "206.753419"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.450"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "206.753419"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.450"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "206.753419"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.475"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "203.249124"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.475"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "203.249124"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.475"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "203.249124"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.475"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "203.249124"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.500"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "199.861639"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.500"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "199.861639"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.500"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "199.861639"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.500"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "199.861639"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.525"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "196.585218"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.525"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "196.585218"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.525"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "196.585218"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.525"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "196.585218"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.550"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "193.414489"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.550"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "193.414489"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.550"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "193.414489"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.550"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "193.414489"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.575"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "190.344418"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.575"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "190.344418"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.575"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "190.344418"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.575"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "190.344418"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.600"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "187.370286"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.600"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "187.370286"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.600"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "187.370286"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.600"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "187.370286"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.625"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "184.487666"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.625"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "184.487666"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.625"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "184.487666"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.625"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "184.487666"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.650"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "181.692399"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.650"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "181.692399"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.650"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "181.692399"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.650"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "181.692399"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.675"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "178.980572"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.675"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "178.980572"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.675"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "178.980572"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.675"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "178.980572"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.700"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "176.348505"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.700"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "176.348505"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.700"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "176.348505"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.700"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "176.348505"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.725"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "173.792729"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.725"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "173.792729"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.725"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "173.792729"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.725"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "173.792729"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.750"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "171.309976"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.750"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "171.309976"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.750"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "171.309976"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.750"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "171.309976"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.775"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "168.897159"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.775"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "168.897159"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.775"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "168.897159"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.775"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "168.897159"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.800"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "166.551366"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.800"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "166.551366"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.800"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "166.551366"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.800"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "166.551366"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.825"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "164.269840"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.825"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "164.269840"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.825"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "164.269840"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.825"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "164.269840"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.850"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "162.049977"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.850"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "162.049977"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.850"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "162.049977"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.850"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "162.049977"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.875"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "159.889311"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.875"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "159.889311"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.875"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "159.889311"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.875"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "159.889311"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.900"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "157.785504"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.900"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "157.785504"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.900"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "157.785504"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.900"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "157.785504"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.925"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "155.736342"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.925"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "155.736342"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.925"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "155.736342"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.925"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "155.736342"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.950"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "153.739722"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.950"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "153.739722"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.950"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "153.739722"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.950"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "153.739722"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_1.975"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "151.793650"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_1.975"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "151.793650"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_1.975"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "151.793650"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_1.975"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "151.793650"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Ep_2.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "149.896229"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hp_2.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "149.896229"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "10.0", "10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Em_2.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "149.896229"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Hm_2.000"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency "149.896229"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-10.0", "-10.0", "-0.385825", "0.385825", "-0.2", "3.0"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "x"
    .PlanePosition "-10.0"
    .Create
End With

With Monitor
    .Reset
    .Name "Enf_1.550"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency "193.414489"
    .UseSubvolume "True"
    .Coordinates "Free"
    .SetSubvolume "-11.0", "11.0", "-0.385825", "0.385825", "0.005", "0.005"
    .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
    .PlaneNormal "z"
    .PlanePosition "0.005"
    .Create
End With

'@ curve for Re(Ez) along x

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Curve.NewCurve "curve1"
With Polygon3D
    .Reset
    .Name "xline"
    .Curve "curve1"
    .Point "-5", "0", "0.005"
    .Point "5", "0", "0.005"
    .Create
End With

'@ solver

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Solver.FrequencyRange "149.9", "299.8"
With Solver
    .Method "Hexahedral"
    .CalculationType "TD-S"
    .StimulationPort "Plane wave"
    .StimulationMode "All"
    .SteadyStateLimit "-40"
    .MeshAdaption "False"
    .StoreTDResultsInCache "False"
    .FullDeembedding "False"
    .SuperimposePLWExcitation "False"
    .UseSensitivityAnalysis "False"
End With

'@ define time domain solver parameters

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-PLW"
     .StimulationPort "Plane wave"
     .StimulationMode "1"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .StoreTDResultsInCache  "False"
     .RunDiscretizerOnly "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ change solver type

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
ChangeSolverType "HF Time Domain"

'@ bars -> Sb2S3_a

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Solid.ChangeMaterial "bars:bar_p", "Sb2S3_a"
Solid.ChangeMaterial "bars:bar_m_top", "Sb2S3_a"
Solid.ChangeMaterial "bars:bar_m_bot", "Sb2S3_a"

'@ plane wave LCP

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
With PlaneWave
    .Reset
    .Normal "0", "0", "-1"
    .EVector "1", "0", "0"
    .Polarization "Circular"
    .ReferenceFrequency "193.4145"
    .PhaseDifference "-90.0"
    .CircularDirection "Left"
    .AxialRatio "0.0"
    .SetUserDecouplingPlane "False"
    .Store
End With

'@ remove spectrum monitors

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Monitor.Delete "Ep_1.000"
Monitor.Delete "Hp_1.000"
Monitor.Delete "Em_1.000"
Monitor.Delete "Hm_1.000"
Monitor.Delete "Ep_1.025"
Monitor.Delete "Hp_1.025"
Monitor.Delete "Em_1.025"
Monitor.Delete "Hm_1.025"
Monitor.Delete "Ep_1.050"
Monitor.Delete "Hp_1.050"
Monitor.Delete "Em_1.050"
Monitor.Delete "Hm_1.050"
Monitor.Delete "Ep_1.075"
Monitor.Delete "Hp_1.075"
Monitor.Delete "Em_1.075"
Monitor.Delete "Hm_1.075"
Monitor.Delete "Ep_1.100"
Monitor.Delete "Hp_1.100"
Monitor.Delete "Em_1.100"
Monitor.Delete "Hm_1.100"
Monitor.Delete "Ep_1.125"
Monitor.Delete "Hp_1.125"
Monitor.Delete "Em_1.125"
Monitor.Delete "Hm_1.125"
Monitor.Delete "Ep_1.150"
Monitor.Delete "Hp_1.150"
Monitor.Delete "Em_1.150"
Monitor.Delete "Hm_1.150"
Monitor.Delete "Ep_1.175"
Monitor.Delete "Hp_1.175"
Monitor.Delete "Em_1.175"
Monitor.Delete "Hm_1.175"
Monitor.Delete "Ep_1.200"
Monitor.Delete "Hp_1.200"
Monitor.Delete "Em_1.200"
Monitor.Delete "Hm_1.200"
Monitor.Delete "Ep_1.225"
Monitor.Delete "Hp_1.225"
Monitor.Delete "Em_1.225"
Monitor.Delete "Hm_1.225"
Monitor.Delete "Ep_1.250"
Monitor.Delete "Hp_1.250"
Monitor.Delete "Em_1.250"
Monitor.Delete "Hm_1.250"
Monitor.Delete "Ep_1.275"
Monitor.Delete "Hp_1.275"
Monitor.Delete "Em_1.275"
Monitor.Delete "Hm_1.275"
Monitor.Delete "Ep_1.300"
Monitor.Delete "Hp_1.300"
Monitor.Delete "Em_1.300"
Monitor.Delete "Hm_1.300"
Monitor.Delete "Ep_1.325"
Monitor.Delete "Hp_1.325"
Monitor.Delete "Em_1.325"
Monitor.Delete "Hm_1.325"
Monitor.Delete "Ep_1.350"
Monitor.Delete "Hp_1.350"
Monitor.Delete "Em_1.350"
Monitor.Delete "Hm_1.350"
Monitor.Delete "Ep_1.375"
Monitor.Delete "Hp_1.375"
Monitor.Delete "Em_1.375"
Monitor.Delete "Hm_1.375"
Monitor.Delete "Ep_1.400"
Monitor.Delete "Hp_1.400"
Monitor.Delete "Em_1.400"
Monitor.Delete "Hm_1.400"
Monitor.Delete "Ep_1.425"
Monitor.Delete "Hp_1.425"
Monitor.Delete "Em_1.425"
Monitor.Delete "Hm_1.425"
Monitor.Delete "Ep_1.450"
Monitor.Delete "Hp_1.450"
Monitor.Delete "Em_1.450"
Monitor.Delete "Hm_1.450"
Monitor.Delete "Ep_1.475"
Monitor.Delete "Hp_1.475"
Monitor.Delete "Em_1.475"
Monitor.Delete "Hm_1.475"
Monitor.Delete "Ep_1.500"
Monitor.Delete "Hp_1.500"
Monitor.Delete "Em_1.500"
Monitor.Delete "Hm_1.500"
Monitor.Delete "Ep_1.525"
Monitor.Delete "Hp_1.525"
Monitor.Delete "Em_1.525"
Monitor.Delete "Hm_1.525"
Monitor.Delete "Ep_1.550"
Monitor.Delete "Hp_1.550"
Monitor.Delete "Em_1.550"
Monitor.Delete "Hm_1.550"
Monitor.Delete "Ep_1.575"
Monitor.Delete "Hp_1.575"
Monitor.Delete "Em_1.575"
Monitor.Delete "Hm_1.575"
Monitor.Delete "Ep_1.600"
Monitor.Delete "Hp_1.600"
Monitor.Delete "Em_1.600"
Monitor.Delete "Hm_1.600"
Monitor.Delete "Ep_1.625"
Monitor.Delete "Hp_1.625"
Monitor.Delete "Em_1.625"
Monitor.Delete "Hm_1.625"
Monitor.Delete "Ep_1.650"
Monitor.Delete "Hp_1.650"
Monitor.Delete "Em_1.650"
Monitor.Delete "Hm_1.650"
Monitor.Delete "Ep_1.675"
Monitor.Delete "Hp_1.675"
Monitor.Delete "Em_1.675"
Monitor.Delete "Hm_1.675"
Monitor.Delete "Ep_1.700"
Monitor.Delete "Hp_1.700"
Monitor.Delete "Em_1.700"
Monitor.Delete "Hm_1.700"
Monitor.Delete "Ep_1.725"
Monitor.Delete "Hp_1.725"
Monitor.Delete "Em_1.725"
Monitor.Delete "Hm_1.725"
Monitor.Delete "Ep_1.750"
Monitor.Delete "Hp_1.750"
Monitor.Delete "Em_1.750"
Monitor.Delete "Hm_1.750"
Monitor.Delete "Ep_1.775"
Monitor.Delete "Hp_1.775"
Monitor.Delete "Em_1.775"
Monitor.Delete "Hm_1.775"
Monitor.Delete "Ep_1.800"
Monitor.Delete "Hp_1.800"
Monitor.Delete "Em_1.800"
Monitor.Delete "Hm_1.800"
Monitor.Delete "Ep_1.825"
Monitor.Delete "Hp_1.825"
Monitor.Delete "Em_1.825"
Monitor.Delete "Hm_1.825"
Monitor.Delete "Ep_1.850"
Monitor.Delete "Hp_1.850"
Monitor.Delete "Em_1.850"
Monitor.Delete "Hm_1.850"
Monitor.Delete "Ep_1.875"
Monitor.Delete "Hp_1.875"
Monitor.Delete "Em_1.875"
Monitor.Delete "Hm_1.875"
Monitor.Delete "Ep_1.900"
Monitor.Delete "Hp_1.900"
Monitor.Delete "Em_1.900"
Monitor.Delete "Hm_1.900"
Monitor.Delete "Ep_1.925"
Monitor.Delete "Hp_1.925"
Monitor.Delete "Em_1.925"
Monitor.Delete "Hm_1.925"
Monitor.Delete "Ep_1.950"
Monitor.Delete "Hp_1.950"
Monitor.Delete "Em_1.950"
Monitor.Delete "Hm_1.950"
Monitor.Delete "Ep_1.975"
Monitor.Delete "Hp_1.975"
Monitor.Delete "Em_1.975"
Monitor.Delete "Hm_1.975"
Monitor.Delete "Ep_2.000"
Monitor.Delete "Hp_2.000"
Monitor.Delete "Em_2.000"
Monitor.Delete "Hm_2.000"

'@ threads 6

'[VERSION]2024.1|33.0.1|20231016[/VERSION]
Solver.MaximumNumberOfThreads "6"

