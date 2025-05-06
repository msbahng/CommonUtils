//
//  BannerViewContainer.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/05/31.
//

import SwiftUI
import Logger
import GoogleMobileAds

public struct BannerViewContainer: UIViewRepresentable {
    
    public static let defaultBannerSize = AdSizeBanner
    
    private let adUnitID: String
    private let bannerSize: AdSize
    @Binding private var isAdLoaded: Bool
    
    public init(
        adUnitID: String,
        bannerSize: AdSize = Self.defaultBannerSize,
        isAdLoaded: Binding<Bool>
    ) {
        self.adUnitID = adUnitID
        self.bannerSize = bannerSize
        _isAdLoaded = isAdLoaded
    }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.addSubview(context.coordinator.bannerView)
        
        NSLayoutConstraint.activate([
            context.coordinator.bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            context.coordinator.bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.bannerView.adSize = bannerSize
    }
    
    public func makeCoordinator() -> BannerCoordinator {
        return BannerCoordinator(self)
    }
    
    @MainActor
    public class BannerCoordinator: NSObject, BannerViewDelegate {
        
        private(set) lazy var bannerView: BannerView = {
            let banner = BannerView(adSize: parent.bannerSize)
            banner.translatesAutoresizingMaskIntoConstraints = false
            banner.adUnitID = parent.adUnitID
            banner.load(Request())
            banner.delegate = self
            return banner
        }()
        
        let parent: BannerViewContainer
        
        init(_ parent: BannerViewContainer) {
            self.parent = parent
        }
        
        public func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            Logger.printLog("\(#function) called")
            parent.isAdLoaded = true
        }
        
        public func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            Logger.printLog("\(#function) called")
        }
    }
}
