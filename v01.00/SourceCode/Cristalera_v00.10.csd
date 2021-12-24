<Cabbage>
form caption("Cristalera by Caio M. Jiacomini") size(400, 300), guiMode("queue") pluginId("cjd1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 1, 0.5, 1, 0.01), text("Gain"), trackerColour(0, 255, 0, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255)

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

//Buffer table
giBuffer    ftgen  0, 0, 1048576, -2, 0 

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


instr Buffer
    //INPUT
        a1 inch 1
        a2 inch 2
        aInput = (a1 + a2)
        
        
    /* WRITE TO BUFFER TABLES */
;        iLength         =         ftlen(giBuffer)               ; table length (in samples)
;        aPointer        phasor    sr/iLength                    ; phase pointer used to write to table
;        aPointer        =         aPointer * iLength            ; reScale pointer according to table size
;                        tablew    aInput, aPointer, giBuffer    ; write audio to table
;        kPointer        downsamp  aPointer                      ; downsamp pointer to k-rate
;        
;        
;        aIndex          line       0, p3, 1
;        aEnv            oscili     0.5, 1/p3, 2                   ; amplitude envelope
;        aSig         tablei     aIndex, giBuffer, 1, 0, 1
        
        outs aSig, aSig
        
endin
instr GrainTrigger

        
    //Grain Duration
;        kDur            chnget "GrainDuration"
;        kDurVarRange    chnget "DurationVariationRange"
;        kDurVarRate     chnget "DurationVariationRate"
;        
;        kLfoDurRange    chnget "LfoDurRange"
;        kLfoDurFreq     chnget "LfoDurFreq"
;    
;        kDurVar     jitter  kDurVarRange, .2 * kDurVarRate, .5 * kDurVarRate
;        kLfoDur     lfo     kLfoDurRange, kLfoDurFreq
;        kDurTotal   limit   kDur + kDurVar + kLfoDur , 0.01, 1
;        
;    //Grain Density
;        kDensity            chnget "GrainDensity"
;        kDensityVarRange    chnget "DensityVariationRange"
;        kDensityVarRate     chnget "DensityVariationRate"
;        
;        kLfoDensityRange    chnget "LfoDensityRange"
;        kLfoDensityFreq     chnget "LfoDensityFreq"
;    
;        kLfoDensity     lfo     kLfoDensityRange, kLfoDensityFreq 
;        kDensityVar     jitter  kDensityVarRange, .2 * kDensityVarRate, .5 * kDensityVarRate
;        kDensityTotal   limit   kDensity + kDensityVar + kLfoDensity, 0.1, 80
        
        ;kTrig metro 5 ;kDensityTotal
        ;schedkwhen kTrigger, 0, 0, "Grains", 0, .2, 
endin

instr Grains
;        kGain chnget "gain"
;        
;        aIndex          line       0, p3, 1
;        aEnv            oscili     kGain, 1/p3, 2                   ; amplitude envelope
;        aSignal         tablei     aIndex, giBuffer, 1, 0, 1
;        
;        chnmix  aSignal * aEnv, "Signal"

endin

instr Output
;    aSig chnget "Signal"
;    
;    outs aSig, aSig
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i "Buffer" 0 [60*60*24*7] 
;i "Trigger" 0 [60*60*24*7] 
;i "Output" 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
