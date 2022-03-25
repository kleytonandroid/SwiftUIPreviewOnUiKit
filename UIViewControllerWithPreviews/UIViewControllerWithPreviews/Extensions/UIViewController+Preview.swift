//
//  UIViewController+Preview.swift
//  UIViewControllerWithPreviews
//
//  Created by Kleyton Santos on 24/03/22.
//
#if canImport(swiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    public var preview: some View {
        return Preview(viewController: self)
    }
}
#endif
