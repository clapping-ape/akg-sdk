//
//  AKGFontManager.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 18/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import Foundation
import UIKit

public class AKGFontManager {
    
    
    @discardableResult public init() {
        self.registerFont()
    }
    
    private func registerFont(){
        
        UIFont.registerFont(
            withFilenameString: "ProximaNova-Regular.otf",
            bundle: Bundle(for: AKGFontManager.self)
        )
        
        UIFont.registerFont(
            withFilenameString: "Proxima Nova Thin.otf",
            bundle: Bundle(for: AKGFontManager.self)
        )
        
        UIFont.registerFont(
            withFilenameString: "Proxima Nova Extrabold.otf",
            bundle: Bundle(for: AKGFontManager.self)
        )
        
        UIFont.registerFont(
            withFilenameString: "Proxima Nova Bold.otf",
            bundle: Bundle(for: AKGFontManager.self)
        )
        
        UIFont.registerFont(
            withFilenameString: "Proxima Nova Black.otf",
            bundle: Bundle(for: AKGFontManager.self)
        )
    }
}

extension UIFont {
    
    public static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+:  Failed to register font - path for resource not found. \(filenameString)")
            return
        }
        
        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }
        
        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }
        
        guard let font = CGFont(dataProvider) else {
            print("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }
        
        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
            print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
    
}
