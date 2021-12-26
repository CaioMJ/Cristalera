<Cabbage>
form caption("Cristalera by Caio M. Jiacomini") size(800,560), guiMode("queue") pluginId("cjd1") colour(0, 0, 0)

//Presets
combobox bounds(266, 10, 353, 32) channelType("string") populate("*.snaps") fontColour(188, 151, 49, 255) channel("combo10")  value("1") automatable(0) text("RESET")
filebutton bounds(632, 10, 64, 32) text("Save", "Save") mode("named preset") channel("filebutton11") outlineThickness(2) outlineColour(188, 151, 49, 255)
filebutton bounds(710, 10, 64, 32) text("Delete", "Delete") mode("remove preset") channel("filebutton12") outlineThickness(2) outlineColour(188, 151, 49, 255)
label bounds(4, 8, 235, 28) fontColour(188, 151, 49, 255) text("C R I S T A L E R A") channel("label3")
label bounds(8, 38, 141, 15) text("by Caio M. Jiacomini") colour(255, 255, 255, 0) fontColour(255, 255, 255, 255) channel("label4")

//Globals
vslider bounds(722, 140, 50, 350), channel("Mix"), range(0, 1, 1, 1, 0.01), text("Mix"), trackerColour(188, 151, 49, 255), outlineColour(0, 0, 0, 50), textColour(255, 255, 255, 255)
vslider bounds(27, 140, 50, 350), channel("Gain"), range(0, 2, 1, 1, 0.01), text("Gain"), trackerColour(188, 151, 49, 255), outlineColour(0, 0, 0, 50), textColour(255, 255, 255, 255)
;vslider bounds(36, 118, 52, 336), channel("InGain"), range(0, 2, 1, 1, 0.01), text("Input Gain"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(255, 255, 255, 255)
label bounds(360, 70, 80, 20) channel("label10029") text("GRAINS") fontColour(255, 255, 255, 255)

button bounds(8, 80, 90, 40) channel("MonoStereo") text("Mono Input", "Stereo Input") outlineThickness(2) outlineColour(188, 151, 49, 255)
button bounds(703, 80, 90, 40) channel("Bypass") text("Bypass", "Bypass") colour:1(255, 0, 0, 255) outlineThickness(2) outlineColour(188, 151, 49, 255)

//Windowing
label bounds(310, 106, 80, 15) channel("label10024") text("Windowing") fontColour(255, 255, 255, 255)
combobox bounds(400, 103, 93, 20) text("Sync", "Hanning", "Blackman-Harris", "Gaussian", "Kaiser", "Rectangle", "") fontColour(188, 151, 49, 255) channel("WindowingSelection") value(2)
//Duration
hslider bounds(120, 140, 245, 35) range(0.01, 1, 0.1, 0.5, 0.01) channel("GrainDuration") text("Grain Duration") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255) 
hslider bounds(120, 180, 245, 35) range(0.01, 1, 0.01, 0.5, 0.01) channel("DurationVariationRange") text("Duration Range") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
hslider bounds(120, 220, 245, 35) range(0.01, 10, 0.01, 1, 0.1) channel("DurationVariationRate") text("Duration Rate") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
//Density
hslider bounds(425, 140, 245, 35) range(0.5, 100, 14, 0.5, 0.1) channel("GrainDensity") text("Grain Density") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
hslider bounds(425, 180, 245, 35) range(0.01, 100, 0.01, 0.5, 0.1) channel("DensityVariationRange") text("Density Range") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
hslider bounds(425, 220, 245, 35) range(0.01, 10, 0.01, 1, 0.1) channel("DensityVariationRate") text("Density Rate") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
//Spread
hslider bounds(164, 262, 300, 35) range(0, 0.5, 0.5, 1, 0.01) text("Grain Spread") channel("GrainSpread") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)

//LFO
label bounds(383, 314, 34, 20) fontColour(255, 255, 255, 255) text("LFO") channel("label20")

label bounds(125, 350, 98, 15) channel("label10025") text("Grain Duration") fontColour(255, 255, 255, 255)
hslider bounds(120, 420, 245, 35) range(0, 0.7, 0, 0.5, 0.01) text("Depth") channel("LfoDurRange") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
hslider bounds(120, 380, 245, 35) range(0, 15, 0, 0.5, 0.01) text("Frequency") channel("LfoDurFreq") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)

label bounds(430, 350, 91, 15) channel("label10026") fontColour(255, 255, 255, 255) text("Grain Density")
hslider bounds(425, 420, 245, 35) range(0, 100, 0, 0.5, 0.01) text("Depth") channel("LfoDensityRange") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
hslider bounds(425, 380, 245, 35) range(0, 15, 0, 0.5, 0.01) text("Frequency") channel("LfoDensityFreq") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)


//METER
hmeter bounds(118, 485, 556, 25) channel("vu1")  outlineColour(255, 255, 255, 255), overlayColour(0, 0, 0, 255) meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255) 
hmeter bounds(118, 520, 556, 25) channel("vu2") value(0) outlineColour(255, 255, 255, 255), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 

//LINES
//Vertical
image bounds(105, 60, 2, 500) channel("image10000") colour(188, 151, 49, 255)
image bounds(695, 60, 2, 500) channel("image10000") colour(188, 151, 49, 255)

//Horizontal
image bounds(0, 60, 900, 2) channel("image10000") colour(188, 151, 49, 255)
image bounds(105, 305, 590, 2) channel("image10000") colour(188, 151, 49, 255)
image bounds(105, 470, 590, 2) channel("image10000") colour(188, 151, 49, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

//Windowing
giWfn9 ftgen 1, 0, 16384, 20, 9 //Sync window
giWfn2 ftgen 2, 0, 16384, 20, 2 //Hanning window
giWfn5 ftgen 3, 0, 16384, 20, 5 //Blackman-Harris window
giWfn5 ftgen 4, 0, 16384, 20, 6, 1, 2 //Gaussian window
giWfn5 ftgen 5, 0, 16384, 20, 7, 1, 3.5 //Kaiser window
giWfn8 ftgen 6, 0, 16384, 20, 8 //Rectangle window

opcode linearRandom_Low, i, iii
    iMin, iMax, iMaxCount xin
    
    iCount = 0
    iRandom = iMax
    
    until iCount == iMaxCount do
        iUniRandom random iMin,iMax
        iRandom = iUniRandom < iRandom ? iUniRandom : iRandom
        iCount += 1
    enduntil
        xout iRandom
endop

opcode linearRandom_High, i, iii
    iMin, iMax, iMaxCount xin
    
    iCount = 0
    iRandom = iMin
    
    until iCount == iMaxCount do
        iUniRandom random iMin,iMax
        iRandom = iUniRandom > iRandom ? iUniRandom : iRandom
        iCount += .5
    enduntil
        xout iRandom
endop


instr Input
        gkMonoStereo chnget "MonoStereo"
        kInGain      chnget "InGain"

        a1 inch 1
        a2 inch 2
        
        //SUM INPUT FOR GRANULATION
        aInputSum = (a1 + a2) * .5   
        chnmix aInputSum, "DrySignalSum"  

    if gkMonoStereo == 1 then 
        //COPY DRY SIGNAL FOR MIX
        chnmix a1, "DrySignalL"   
        chnmix a2, "DrySignalR"  
    endif
      
endin

instr GrainTrigger        
    //Grain Duration
        kDur            chnget "GrainDuration"
        kDurVarRange    chnget "DurationVariationRange"
        kDurVarRate     chnget "DurationVariationRate"
        
        kLfoDurRange    chnget "LfoDurRange"
        kLfoDurFreq     chnget "LfoDurFreq"
    
        kDurVar     jitter  kDurVarRange, .2 * kDurVarRate, .5 * kDurVarRate
        kLfoDur     lfo     kLfoDurRange, kLfoDurFreq
        kDurTotal   limit   kDur + kDurVar + kLfoDur , 0.01, 1
        
    //Grain Density
        kDensity            chnget "GrainDensity"
        kDensityVarRange    chnget "DensityVariationRange"
        kDensityVarRate     chnget "DensityVariationRate"
        
        kLfoDensityRange    chnget "LfoDensityRange"
        kLfoDensityFreq     chnget "LfoDensityFreq"
    
        kLfoDensity     lfo     kLfoDensityRange, kLfoDensityFreq 
        kDensityVar     jitter  kDensityVarRange, .2 * kDensityVarRate, .5 * kDensityVarRate
        kDensityTotal   limit   kDensity + kDensityVar + kLfoDensity, 0.1, 80
        
        kTrigger metro kDensityTotal
        
        schedkwhen kTrigger, 0, 0, "Grains", 0, kDurTotal 
endin

instr Grains
        aSig chnget "DrySignalSum"
        
        //WINDOWING
            iWfn = chnget:i("WindowingSelection")
        
            kWindowIndex line 0, p3, 1
            kWindowEnv table kWindowIndex, iWfn, 1 
            aWindowEnv interp kWindowEnv
            
            aSig *= aWindowEnv
       
        //RANDOM PAN
            iSpread chnget "GrainSpread"
            iRandomLow linearRandom_Low -iSpread, -iSpread/2, 50
            iRandomHigh linearRandom_High iSpread, iSpread/2, 50
            iRandomArray[] fillarray iRandomLow, iRandomHigh
        
            iRandomIndexSelector random 0, 1
            iRandomIndex = iRandomIndexSelector < 0.5 ? 0 : 1
            aGrainL, aGrainR pan2 aSig, .5 + iRandomArray[iRandomIndex]
            
        //OUTPUT
            chnmix  aGrainL, "GrainSignalL"
            chnmix  aGrainR, "GrainSignalR"
endin

instr Output
    kBypass chnget "Bypass"
    kMix    chnget "Mix"
    kGain   chnget "Gain"
    aGrainL chnget "GrainSignalL"
    aGrainR chnget "GrainSignalR"
    
    aDryL   chnget "DrySignalL"
    aDryR   chnget "DrySignalR"
    aDrySum chnget "DrySignalSum"
    
    if gkMonoStereo == 0 then
        aMixL ntrpol aDrySum, aGrainL, kMix
        aMixR ntrpol aDrySum, aGrainR, kMix
    elseif gkMonoStereo == 1 then
        aMixL ntrpol aDryL, aGrainL, kMix
        aMixR ntrpol aDryR, aGrainR, kMix
    endif
    
    if kBypass == 0 then
        outs aMixL * kGain, aMixR * kGain
    elseif  kBypass == 1 then
        if gkMonoStereo == 0 then
            outs aDrySum, aDrySum
        elseif gkMonoStereo == 1 then
            outs aDryL, aDryR
        endif
    endif
    
    //METER DISPLAY
    kVu1 rms aMixL, 20
    kVu2 rms aMixR, 20
    
    cabbageSetValue "vu1", portk(kVu1*10, .25), metro(10)
    cabbageSetValue "vu2", portk(kVu2*10, .25), metro(10)
    
    //CLEAR CHANNELS
    chnclear "GrainSignalL"
    chnclear "GrainSignalR"
    chnclear "DrySignalSum"
    chnclear "DrySignalL"
    chnclear "DrySignalR"
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i "Input" 0 [60*60*24*7] 
i "GrainTrigger" 0 [60*60*24*7] 
i "Output" 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
