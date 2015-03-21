//
//  Font.swift
//  DIT
//
//  Created by Stephen Fox on 13/03/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

import UIKit

// Defines light, regular or bold font styles
enum FontStyle: Int {
    case Light
    case Regular
    case Bold
}

// Currently this app only supports one typeface
enum AppFont: Int {
    case AvenirNext
}

// Use this class to access custom app fonts, used across the app.
// 
// @supports Avenir Next
class Font {
    
    
    
    // Get font is the only public method to this class, all the other methods 
    // in this class must be called from getFont() method.
    func getFont(font: AppFont, fontStyle: FontStyle, size: CGFloat) -> UIFont {
        
        var fontToReturn: UIFont?
        
        if (font == AppFont.AvenirNext) {
            fontToReturn = getAvenirFont(fontStyle, size: size)
            return fontToReturn!
        }
        
        // As we don't currently support any other fonts, return the font regardless
        return fontToReturn!
    }
    
    
    // Method allows us to access all the current suported Avenir Next Fonts
    // 
    // @param fontStyle: The style of font to be used i.e. Light, Regular etc
    // @param size: The size of the font
    //
    // @return Avenir Font
    private func getAvenirFont(fontStyle: FontStyle, size: CGFloat) -> UIFont {
        
        // List of avenir next font this app supports
        var avenirFonts:[String] = ["AvenirNext-UltraLight", "AvenirNext-Regular", "AvenirNext-Bold"]
        
        switch (fontStyle) {
        
        case .Light:
            return UIFont(name: avenirFonts[0], size: size)!
            
        case .Regular:
            return UIFont(name: avenirFonts[1], size: size)!
            
        case .Bold:
            return UIFont(name: avenirFonts[2], size: size)!
            
        default:
            return UIFont(name: avenirFonts[1], size: 20.00)!
        
        }
    }

}
