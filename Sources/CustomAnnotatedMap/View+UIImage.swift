import SwiftUI
import UIKit

//extension View {
//    func snapshot() -> UIImage {
//
//        let controller = UIHostingController(rootView: self.edgesIgnoringSafeArea(.all))
//
//        // locate far out of screen
//        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
//
//        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
//        controller.view.bounds = CGRect(origin: .zero, size: size)
//        controller.view.sizeToFit()
//        UIApplication.shared.windows.first?.rootViewController?.view.addSubview(controller.view)
//
////        UIApplication.shared.connectedScenes.first.sce
//
//        let image = controller.view.asImage()
//        controller.view.removeFromSuperview()
//        return image
//    }
//}
//
//extension UIView {
//    func asImage() -> UIImage {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        return renderer.image { rendererContext in
//            layer.render(in: rendererContext.cgContext)
//        }
//    }
//}

extension View {
    func snapshot() -> UIImage {

        var frame: CGRect = .zero

        let controller = UIHostingController(
            rootView:
                self
                .edgesIgnoringSafeArea(.all)
                .background {
                    GeometryReader { proxy in
                        Spacer()
                            .onAppear {
                                frame = proxy.frame(in: .global)
                            }
                    }
                }
        )

        controller.view.frame = frame
        // controller.view.backgroundColor = .clear

        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        UIApplication.shared.windows.first?.rootViewController?.view.addSubview(controller.view)

        let image = controller.view.asImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
