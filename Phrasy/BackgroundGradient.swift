//
//  BackgroundGradient.swift
//  Phrasy
//
//  Created by Marty Nodado on 4/26/21.
//

import Foundation
import UIKit

var gradient: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.type = .axial
    gradient.colors = [
        UIColor(hex: "#3673C7FF")!.cgColor,
        UIColor(hex: "#63D47CFF")!.cgColor
    ]
    gradient.startPoint = CGPoint(x: -0.5, y: -0.5)
    gradient.endPoint = CGPoint(x: 1.5, y: 1.5)
    return gradient
}()

