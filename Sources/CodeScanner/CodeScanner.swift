
import AVFoundation
import SwiftUI

public enum ScanError: Error {
    case badInput
    case badOutput
    case initError(_ error: Error)
    case permissionDenied
}

@available(macCatalyst 14.0, *)
public struct ScanResult {
    public let string: String
    public let type: AVMetadataObject.ObjectType
    public let image: UIImage?
    public let corners: [CGPoint]
}

public enum ScanMode {
    case once
    case oncePerCode
    case continuous
    case manual
}

@available(macCatalyst 14.0, *)
public struct CodeScannerView: UIViewControllerRepresentable {
    
    public let codeTypes: [AVMetadataObject.ObjectType]
    public let scanMode: ScanMode
    public let manualSelect: Bool
    public let scanInterval: Double
    public let showViewfinder: Bool
    public var simulatedData = ""
    public var shouldVibrateOnSuccess: Bool
    public var isTorchOn: Bool
    public var isGalleryPresented: Binding<Bool>
    public var videoCaptureDevice: AVCaptureDevice?
    public var completion: (Result<ScanResult, ScanError>) -> Void

    public init(
        codeTypes: [AVMetadataObject.ObjectType],
        scanMode: ScanMode = .once,
        manualSelect: Bool = false,
        scanInterval: Double = 2.0,
        showViewfinder: Bool = false,
        simulatedData: String = "",
        shouldVibrateOnSuccess: Bool = true,
        isTorchOn: Bool = false,
        isGalleryPresented: Binding<Bool> = .constant(false),
        videoCaptureDevice: AVCaptureDevice? = AVCaptureDevice.bestForVideo,
        completion: @escaping (Result<ScanResult, ScanError>) -> Void
    ) {
        self.codeTypes = codeTypes
        self.scanMode = scanMode
        self.manualSelect = manualSelect
        self.showViewfinder = showViewfinder
        self.scanInterval = scanInterval
        self.simulatedData = simulatedData
        self.shouldVibrateOnSuccess = shouldVibrateOnSuccess
        self.isTorchOn = isTorchOn
        self.isGalleryPresented = isGalleryPresented
        self.videoCaptureDevice = videoCaptureDevice
        self.completion = completion
    }

    public func makeUIViewController(context: Context) -> ScannerViewController {
        return ScannerViewController(showViewfinder: showViewfinder, parentView: self)
    }

    public func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        uiViewController.parentView = self
        uiViewController.updateViewController(
            isTorchOn: isTorchOn,
            isGalleryPresented: isGalleryPresented.wrappedValue,
            isManualCapture: scanMode == .manual,
            isManualSelect: manualSelect
        )
    }
    
}

@available(macCatalyst 14.0, *)
struct CodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        CodeScannerView(codeTypes: [.qr]) { result in
            // do nothing
        }
    }
}
