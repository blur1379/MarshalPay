//
//  Extentions.swift
//  Marshal
//
//  Created by Blur on 10/16/1400 AP.
//

import Foundation
import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

extension String { var toLocale: Locale { return Locale(identifier: self) } }

extension NumberFormatter {
    convenience init(numberStyle: NumberFormatter.Style, groupingSeparator: String?, decimalSeparator: String?) {
        self.init()
        set(numberStyle: numberStyle, groupingSeparator: groupingSeparator, decimalSeparator: decimalSeparator)
    }

    convenience init(numberStyle: NumberFormatter.Style, locale: Locale) {
        self.init()
        set(numberStyle: numberStyle, locale: locale)
    }

    func set(numberStyle: NumberFormatter.Style, groupingSeparator: String?, decimalSeparator: String?) {
        self.locale = nil
        self.numberStyle = numberStyle
        self.groupingSeparator = groupingSeparator
        self.decimalSeparator = decimalSeparator
    }

    func set(numberStyle: NumberFormatter.Style, locale: Locale?) {
        self.numberStyle = numberStyle
        self.locale = locale
    }
}

extension Numeric {
    func format(formatter: NumberFormatter) -> String? {
        if let num = self as? NSNumber { return formatter.string(from: num) }
        return nil
    }
}


extension UIImage {
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }

    func compress(to kb: Int, allowedMargin: CGFloat = 0.2) -> Data {
        let bytes = kb * 1024
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        var complete = false
        while(!complete) {
            if let data = holderImage.jpegData(compressionQuality: 1.0) {
                let ratio = data.count / bytes
                if data.count < Int(CGFloat(bytes) * (1 + allowedMargin)) {
                    complete = true
                    return data
                } else {
                    let multiplier:CGFloat = CGFloat((ratio / 5) + 1)
                    compression -= (step * multiplier)
                }
            }
            
            guard let newImage = holderImage.resized(withPercentage: compression) else { break }
            holderImage = newImage
        }
        return Data()
    }
}
