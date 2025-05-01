//
//  BannerView.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/05/31.
//

import SwiftUI
import Logger
import GoogleMobileAds

public struct BannerView: UIViewControllerRepresentable {
    
    public static let defaultBannerSize = AdSizeBanner
    
    private let adUnitID: String
    private let bannerSize: AdSize
    
    private let bannerView = AdManagerBannerView()
    
    public init(
        adUnitID: String,
        bannerSize: AdSize = Self.defaultBannerSize
    ) {
        self.adUnitID = adUnitID
        self.bannerSize = bannerSize
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        let bannerViewController = UIViewController()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = bannerViewController
        bannerView.delegate = context.coordinator
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerViewController.view.addSubview(bannerView)
        bannerViewController.view.backgroundColor = UIColor.systemBackground
        
        // Constrain GADBannerView to the bottom of the view.
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(
                equalTo: bannerViewController.view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: bannerViewController.view.centerXAnchor),
        ])
        
        return bannerViewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        bannerView.adSize = bannerSize
        bannerView.load(Request())
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final public class Coordinator: NSObject, BannerViewDelegate {
        let parent: BannerView
        
        init(_ parent: BannerView) {
            self.parent = parent
        }
        
        private func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
        }
        
        private func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            Logger.printLog("\(#function) called")
        }
        
        private func bannerViewDidRecordImpression(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
        }
        
        private func bannerViewWillPresentScreen(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
        }
        
        private func bannerViewWillDismissScreen(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
        }
        
        private func bannerViewDidDismissScreen(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
        }
    }
}
