//
//  IntrospectPackage.swift
//  Goals Busters
//
//  Created by Danielle Lewis on 7/27/23.
//

import SwiftUI
import SwiftUIIntrospect

public struct NavigationTitleFontModifier: ViewModifier {
    public var font: UIFont

    public func body(content: Content) -> some View {
            content
            .introspect(.navigationView(style: .stack), on: .iOS(.v13, .v14, .v15, .v16, .v17)) { navigationController in
                navigationController.navigationBar.titleTextAttributes = [.font:font]
            }
        }
}

extension UIFont {
    public struct custom {
        static func ghostBust(ofSize size: CGFloat) -> UIFont {
            return UIFont(name: "ghostbusters.TTF", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}

public extension View {
    func navigationTitleFont(font: UIFont) -> some View {
        self.modifier(NavigationTitleFontModifier(font: font))
    }
}
