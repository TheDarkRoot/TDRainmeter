;=
; common measures/meters
;============================

[mAudioOut]
; http://docs.rainmeter.net/manual-beta/plugins/audiolevel#FFTOptions
Measure=Plugin
Plugin=AudioLevel
Port=Output
FFTSize=#FFTSize#
FFTOverlap=#FFTOverlap#
FFTAttack=#FFTAttack#
FFTDecay=#FFTDecay#
FreqMin=#FreqMin#
FreqMax=#FreqMax#
Sensitivity=#Sensitivity#
RMSAttack=#FFTAttack#
RMSDecay=#FFTDecay#

[mRMS]
Measure=Plugin
Plugin=AudioLevel
Parent=mAudioOut
IfAboveValue=0.00011
IfAboveAction=[!ShowFade]
IfCondition=(#HideWhenVolumeZero#=1) && (mRMS<=0.0001)
IfTrueAction=[!HideFade]
UpdateDivider=20
DynamicVariables=1

[mState]
Measure=Plugin
Plugin=NowPlaying.dll
PlayerName=#Player#
PlayerType=State
IfEqualValue=1
IfEqualAction=[!ShowFade]
IfCondition=(#HideWhenNotPlaying#=1) && (mState<>1)
IfTrueAction=[!HideFade]
UpdateDivider=20
DynamicVariables=1

[Back]
Meter=Image
W=(#Radius#*2+#VariationMax#*2)
H=(#RadiusY#*2+#VariationMax#*2)
SolidColor=0,0,0,1
UpdateDivider=-1