//
//  DemoInstrument.swift
//  SwiftOSXProofOfConcept
//
//  Created by Aurelius Prochazka on 9/7/15.
//  Copyright (c) 2015 AudioKit. All rights reserved.
//

import Foundation

class DemoInstrument: AKInstrument {

    var oscillatingFrequency: AKOscillator
    var fmOscillator: AKFMOscillator
    
    override init() {
        
        // Method 1: Full Initializer
        oscillatingFrequency = AKOscillator(
            frequency: akp(1),
            amplitude: akp(440),
            phase: 0.0
        )
        
        // Method 2: Default Initializer plus property setting
        oscillatingFrequency = AKOscillator()
        oscillatingFrequency.frequency = akp(1)
        oscillatingFrequency.amplitude = akp(440)
        
        // Method 1: Full Initializer
        fmOscillator = AKFMOscillator(
            baseFrequency: oscillatingFrequency,
            carrierMultiplier: akp(3),
            modulatingMultiplier: akp(5),
            modulationIndex: akp(11),
            amplitude: akp(0.1)
        )
        
        // Method 2: Default Initializer plus property setting
        fmOscillator = AKFMOscillator()
        fmOscillator.baseFrequency        = oscillatingFrequency
        fmOscillator.carrierMultiplier    = 3.ak
        fmOscillator.modulatingMultiplier = 5.ak
        fmOscillator.modulationIndex      = 11.ak
        fmOscillator.amplitude            = 0.5.ak
        
        
        super.init()
        operations.append(oscillatingFrequency)
        operations.append(fmOscillator)
    }
    
}