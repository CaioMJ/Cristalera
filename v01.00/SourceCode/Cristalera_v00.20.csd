<Cabbage>
form caption("Cristalera by Caio M. Jiacomini") size(900,500), guiMode("queue") pluginId("cjd1") colour(0, 0, 0)
rslider bounds(674, 120, 100, 100), channel("Mix"), range(0, 1, 1, 1, 0.01), text("Mix"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(255, 255, 255, 255)

//Windowing
label bounds(315, 109, 97, 14) text("Windowing") fontColour(255, 255, 255, 255)
combobox bounds(420, 107, 93, 20) text("Sync", "Hanning", "Blackman-Harris", "Gaussian", "Kaiser", "Rectangle", "") fontColour(188, 151, 49, 255) channel("WindowingSelection") value(2)
//Duration
rslider bounds(254, 133, 80, 56) range(0.01, 1, 0.1, 0.5, 0.01) channel("GrainDuration") text("Grain Duration") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(224, 254, 80, 56) range(0.01, 1, 0.01, 0.5, 0.01) channel("DurationVariationRange") text("Duration Range") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(224, 328, 80, 56) range(0.01, 10, 0.01, 1, 0.1) channel("DurationVariationRate") text("Duration Rate") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
//Density
rslider bounds(338, 133, 80, 56) range(0.5, 100, 14, 0.5, 0.1) channel("GrainDensity") text("Grain Density") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(308, 254, 80, 56) range(0.01, 100, 0.01, 0.5, 0.1) channel("DensityVariationRange") text("Density Range") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(308, 328, 80, 56) range(0.01, 10, 0.01, 1, 0.1) channel("DensityVariationRate") text("Density Rate") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)

hslider bounds(244, 200, 332, 29) range(0, 0.5, 0.5, 1, 0.01) text("Grain Spread") channel("GrainSpread") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)

//LFO
label bounds(456, 254, 110, 14) fontColour(255, 255, 255, 255) text("Grain Duration") channel("label20")
rslider bounds(514, 278, 80, 56) range(0, 0.7, 0, 0.5, 0.01) text("Depth") channel("LfoDurRange") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(434, 278, 80, 56) range(0, 15, 0, 0.5, 0.01) text("Frequency") channel("LfoDurFreq") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)

label bounds(454, 336, 111, 14) fontColour(255, 255, 255, 255) text("Grain Density")
rslider bounds(508, 360, 80, 56) range(0, 100, 0, 0.5, 0.01) text("Depth") channel("LfoDensityRange") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
rslider bounds(428, 360, 80, 56) range(0, 15, 0, 0.5, 0.01) text("Frequency") channel("LfoDensityFreq") trackerColour(188, 151, 49, 255) textColour(255, 255, 255, 255)
button bounds(236, 48, 80, 40) channel("MonoStereo") text("Mono Input", "Stereo Input")
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

        a1 inch 1
        a2 inch 2
        
        //SUM INPUT FOR GRANULATION
        aInputSum = (a1 + a2)     
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
            iRandomLow linearRandom_Low -iSpread, 0, 50
            iRandomHigh linearRandom_High 0, iSpread, 50
            iRandomArray[] fillarray iRandomLow, iRandomHigh
        
            iRandomIndexSelector random 0, 1
            iRandomIndex = iRandomIndexSelector < 0.5 ? 0 : 1
            aGrainL, aGrainR pan2 aSig, .5 + iRandomArray[iRandomIndex]
            
        //OUTPUT
            chnmix  aGrainL, "GrainSignalL"
            chnmix  aGrainR, "GrainSignalR"
endin

instr Output
    kMix chnget "Mix"
    aGrainL chnget "GrainSignalL"
    aGrainR chnget "GrainSignalR"
    
    aDryL chnget "DrySignalL"
    aDryR chnget "DrySignalR"
    aDrySum chnget "DrySignalSum"
    
    if gkMonoStereo == 0 then
        aMixL ntrpol aDrySum, aGrainL, kMix
        aMixR ntrpol aDrySum, aGrainR, kMix
    else
        aMixL ntrpol aDryL, aGrainL, kMix
        aMixR ntrpol aDryR, aGrainR, kMix
    endif
    
    outs aGrainL, aGrainR
    
    chnclear "GrainSignalL"
    chnclear "GrainSignalR"
    chnclear "DrySignalSum"
    chnclear "DrySignalL"
    chnclear "DrySignalR"
    
    ;printk 0.3, gkMonoStereo
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
