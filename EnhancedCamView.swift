//
//  EnhancedCamView.swift
//  EnhancedCam
//
//  Created by Andriyanto Halim on 4/8/24.
//

import SwiftUI
import AVFoundation

struct EnhancedCamView: View {
    @ObservedObject var viewModel = EnhancedCamViewModel()

    var body: some View {
        ZStack {
            CameraPreview(previewLayer: viewModel.getPreviewLayer())
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Button(action: {
                    viewModel.capturePhoto()
                }) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2)
                                .frame(width: 60, height: 60)
                        )
                        .shadow(radius: 10)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    let previewLayer: AVCaptureVideoPreviewLayer?

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        if let previewLayer = previewLayer {
            previewLayer.frame = UIScreen.main.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    EnhancedCamView()
}
