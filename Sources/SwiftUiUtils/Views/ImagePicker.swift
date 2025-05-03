//
//  ImagePicker.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/27.
//

import PhotosUI
import SwiftUI
import CommonUtils
import Logger

public struct ImagePicker: UIViewControllerRepresentable {
    public enum SelectionType {
        case single
        case multiple
    }
    
    private let selectionType: SelectionType
    @Binding private var images: [URL]
    private let selectionLimit: Int?
    
    public init(
        selectionType: SelectionType,
        images: Binding<[URL]>,
        selectionLimit: Int? = 0
    ) {
        self.selectionType = selectionType
        self.selectionLimit = selectionType == .single ? 1 : selectionLimit
        _images = images
    }
    
    public func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = selectionLimit ?? 0
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public final class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
            self.parent.images.removeAll()
        }
        
        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            guard !results.isEmpty else {
                picker.dismiss(animated: true)
                return
            }
                        
            for (_, result) in results.enumerated() {
                let provider = result.itemProvider
                
                provider.loadFileRepresentation(forTypeIdentifier: "public.item") { (url, error) in
                    guard let url else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self.parent.images.append(url)
                    }
                }
                
//                if provider.canLoadObject(ofClass: UIImage.self) {
//                    provider.loadObject(ofClass: UIImage.self) { image, _ in
//                        guard let image = image as? UIImage else {
//                            return
//                        }
//                        
//                        DispatchQueue.main.async {
//                            self.parent.images.append(image)
//                        }
//                    }
//                }
            }
            
            picker.dismiss(animated: true)
        }
    }
}

extension NSItemProvider: @unchecked @retroactive Sendable {}
