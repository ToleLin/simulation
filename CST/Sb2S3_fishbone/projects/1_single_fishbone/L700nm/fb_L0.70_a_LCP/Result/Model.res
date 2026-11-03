MWS Result File Version 20150206
size=i:39

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
files=s:simulation_overview.json

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:RefSpectrum_pw.sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:Enf_1.550_pw.m3d

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshDetails.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAConnectivity.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
files=s:PBAMeshFeedback.axg

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:World.fid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:model.gex

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.sid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.fmm

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:persistent
result=s:0
files=s:MCalcAccess.log

type=s:FOLDER
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results

type=s:XYSIGNAL
subtype=s:user
problemclass=s::4:3
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default_lf.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::0:0
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default.sig

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBA
files=s:PBAMeshFeedback.rex
ylabel=s:Mesh Feedback

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\Connectivity
files=s:PBAConnectivity.rex
ylabel=s:Mesh Feedback

type=s:MESH_FEEDBACK
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Mesh\Information\PBADetails
files=s:PBAMeshDetails.rex
ylabel=s:Mesh Feedback

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\Plane wave (major axis)
files=s:plw.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\Plane wave (minor axis)
files=s:plw_2nd.sig

type=s:EFIELD3D
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\E-Field\Enf_1.550 [pw]
files=s:Enf_1.550_pw.m3d
files=s:Enf_1.550_pw_m3d.rex

type=s:XYSIGNAL
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Energy\Energy [pw]
files=s:pw.eng

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Au_JC_Drude
files=s:cVolume_loss_in_Au_JC_Drude(pw).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Sb2S3_a
files=s:cVolume_loss_in_Sb2S3_a(pw).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [pw]\Loss in Dielectrics
files=s:cTotal_loss_in_dielectrics(pw).sig

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\Plane wave (major axis)
files=s:plw.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\Plane wave (minor axis)
files=s:plw_2nd.sig

type=s:XYSIGNAL
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Energy\Energy [pw]
files=s:pw.eng

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Au_JC_Drude
files=s:cVolume_loss_in_Au_JC_Drude(pw).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [pw]\Loss per Material\Volume loss in Sb2S3_a
files=s:cVolume_loss_in_Sb2S3_a(pw).sig

type=s:XYSIGNAL
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [pw]\Loss in Dielectrics
files=s:cTotal_loss_in_dielectrics(pw).sig

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:external
lifetime=s:rebuild
result=s:0
user_delete=s:1
treepath=s:1D Results\Re(Ez) along x\1.55 um
files=s:ReEz_along_x_1550.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Au_JC_Drude\Dispersive\Eps'
files=s:Au_JC_Drude_eps_re.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Au_JC_Drude\Dispersive\Eps''
files=s:Au_JC_Drude_eps_im.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Sb2S3_a\Dispersive\Eps'
files=s:Sb2S3_a_eps_re.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Sb2S3_a\Dispersive\Eps''
files=s:Sb2S3_a_eps_im.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Sb2S3_c\Dispersive\Eps'
files=s:Sb2S3_c_eps_re.sig

type=s:XYSIGNAL
subtype=s:user
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results\Materials\Sb2S3_c\Dispersive\Eps''
files=s:Sb2S3_c_eps_im.sig

