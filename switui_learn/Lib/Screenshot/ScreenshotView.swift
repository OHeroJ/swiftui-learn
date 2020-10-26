//
//  Screenshot.swift
//  switui_learn
//
//  Created by laijihua on 2020/10/26.
//

import SwiftUI
import Combine
import UIKit
import Photos

extension UIView {
    var renderedImage: UIImage? {
        // rect of capure
        let rect = self.bounds
        // create the context of bitmap
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        // get a image from current context bitmap
        let capturedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

extension View {
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage? {
        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = CGRect(origin: origin, size: size)
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderedImage
    }
    
    func saveImageToPhotoLibrary(image: UIImage?) {
        guard let img = image else {
            return
        }
        // 判断权限
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            saveImage(image: img)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    saveImage(image: img)
                } else {
                    print("User denied")
                }
            }
            
        case .restricted, .denied:
            if let url = URL.init(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.openURL(url)
                }
            }
        default:
            break;
        }
    }
        
    private func saveImage(image: UIImage) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: { (isSuccess, error) in
            DispatchQueue.main.async {
                if isSuccess {// 成功
                    print("Success")
                }
            }
        })
    }
}


