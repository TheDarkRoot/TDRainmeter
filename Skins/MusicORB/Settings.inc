;  __  __               ____             __       __       ___             
; /\ \/\ \  __         /\  _`\          /\ \     /\ \     /\_ \            
; \ \ \ \ \/\_\    ____\ \ \L\ \  __  __\ \ \____\ \ \____\//\ \      __   
;  \ \ \ \ \/\ \  /',__\\ \  _ <'/\ \/\ \\ \ '__`\\ \ '__`\ \ \ \   /'__`\ 
;   \ \ \_/ \ \ \/\__, `\\ \ \L\ \ \ \_\ \\ \ \L\ \\ \ \L\ \ \_\ \_/\  __/ 
;    \ `\___/\ \_\/\____/ \ \____/\ \____/ \ \_,__/ \ \_,__/ /\____\ \____\
;     `\/__/  \/_/\/___/   \/___/  \/___/   \/___/   \/___/  \/____/\/____/
;
; @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
; http://madhoe.deviantart.com/art/VisBubble-for-Rainmeter-488601501
; UNIVERSAL SETTINGS
; You can override individual settings in the .ini files.
;========================================================================
;
; General FAQ:
; - HAVING PROBLEMS WITH AUDIO FREEZING?
; --- Reduce the FFTDecay value below.
; - USING TOO MUCH CPU?
; --- Reduce the NumOfItems, or FFTSize & FFTOverlap, or even increase the Update rate in individual files
;
[Variables]
; CHANGE PLAYER HERE! http://docs.rainmeter.net/manual/plugins/nowplaying
; This is to hide the visualizer when no music player is playing
Player=CAD
HideWhenNotPlaying=0
;
; The size of the circle
;<---WARNING: Do not Change below value, If you do it will ruin the skin!!!!! 
Radius=83
;<---WARNING: Do not Change above value, If you do it will ruin the skin!!!!! 

; Color of shapes/lines/bars. ItemColor2 is for MultiLineExtrude
ItemColor=255,255,255,255
;
;
; Width of shapes/lines/bars
ItemWidth=5
;
; Number of shapes/lines/bars
NumOfItems=100
;
; How much to extrude line/bar/shape or max shape size for ShapeBubble
VariationMax=150
;
; The shapes extrude at a ^2 pace (You can set higher for ^n)
; ie. it's "more difficult" for the shapes to extrude
Squared=0
;
;
;
; ANGLES: In radians, you can also use Rad(<input value in deg>)
; NOTE: VALUES ARE ALWAYS CLOCKWISE, STARTING FROM 0 WHICH FACES RIGHT
; What angle does the lowest freq start at?
AngleStart=(Rad(450))
; How much angle the items fill, from 0 - 360 in rad.
AngleTotal=(Rad(360))
; Whether the AngleTotal and AngleStart affects the BackCircle, if 0 then circle will always be full
AnglesAffectBackCircle=0
;
; Set to 0 for counterCW, 1 for CW (DOES NOT affect AngleStart/AngleTotal)
ClockWise=0
;
; FFT Options: For more detailed info, read http://docs.rainmeter.net/manual-beta/plugins/audiolevel#FFTOptions
FFTSize=2048
FFTOverlap=1024
FFTAttack=30
FFTDecay=130
FreqMin=800
FreqMax=13000
Sensitivity=60
;
;
;
;=
; constants (don't edit!)
;============================
SCRIPT=#@#scripts/
INC=#@#includes/