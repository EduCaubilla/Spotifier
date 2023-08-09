//
//  Extensions.swift
//  Spotifier
//
//  Created by Edu Caubilla on 24/07/2023.
//

import Foundation
import UIKit

extension UIView{
    var width: CGFloat{
        return frame.size.width
    }
    var height: CGFloat{
        return frame.size.height
    }
    var left: CGFloat{
        return frame.origin.x
    }
    var right: CGFloat{
        return left + width
    }
    var top: CGFloat{
        return frame.origin.y
    }
    var bottom: CGFloat{
        return height + top
    }
}

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    static let displayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
}

extension String{
    static func formattedDate(string: String) -> String {
        guard let date = DateFormatter.dateFormatter.date(from: string) else {
            return string
        }
        return DateFormatter.displayDateFormatter.string(from: date)
    }
}
