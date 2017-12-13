//
//  CodeType.swift
//  QRCodeGenerator
//
//  Created by N A Shashank on 12/13/17.
//  Copyright © 2017 N A Shashank. All rights reserved.
//

import UIKit

enum CodeType{
    case barcode
    case qrcode
    
    private func filterName() -> String
    {
        var strTemp = String()
        switch self
        {
        case CodeType.barcode:
            strTemp = "CICode128BarcodeGenerator"
        case CodeType.qrcode:
            strTemp = "CIQRCodeGenerator"
        }
        return strTemp
    }
    
    func image(string:String,imgViewFrame:CGRect) -> UIImage?
    {
        let data = string.data(using: String.Encoding.utf8)
        guard let filter = CIFilter(name: self.filterName()) else{
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        if self == CodeType.qrcode
        {
            filter.setValue("H", forKey: "inputCorrectionLevel")
        }
        
        guard let imgCode = filter.outputImage else{
            return nil
        }
        let scaleX = imgViewFrame.size.width / imgCode.extent.size.width
        let scaleY = imgViewFrame.size.height / imgCode.extent.size.height
        let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        return UIImage(ciImage:imgCode.transformed(by: transform))
    }
}
