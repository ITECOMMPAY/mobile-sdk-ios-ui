//
//  LoadingScreen.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 09.08.2022.
//

import Foundation
import SwiftUI

enum LoadingScreenIntent {
    case close
}

protocol LoadingScreenViewModelProtocol: ViewModel
where UserIntent == LoadingScreenIntent, ViewState == Void {} // ViewState == Void т.к. этот экран всегда в одном состоянии, его представление неизменно

class LoadingScreenViewModel<rootVM: RootViewModelProtocol>: ChildViewModel<Void, LoadingScreenIntent, rootVM>, LoadingScreenViewModelProtocol {
    override func mapIntent(from childIntent: LoadingScreenIntent) throws -> rootVM.UserIntent {
        return .loadingScreenIntent(childIntent)
    }
}

private struct DotsAnimationParams {
    static let dotSize: CGFloat = 12
    static var dotSpacing: CGFloat { dotSize }
    static var amplitude: CGFloat { dotSize * 2.2 }
    static var jumpDuration: Double = 0.325
    static var delayDuration: Double = jumpDuration * 2
}

private struct LoadingScreenAnimationState {
    var showDots = false
    
    var titleOffset: CGFloat = 40
    var showTitle = false
    
    var subtitleOffset: CGFloat = 12
    var showSubtitle = false
    
    var showButton = false
}

struct LoadingScreen<VM: LoadingScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    public var body: some View {
        LoadingView() {
            viewModel.dispatch(intent: .close)
        }
    }
}

struct LoadingView: View {
    var cancelAction: () -> Void = {}
    @State private var animationState = LoadingScreenAnimationState()
    
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: UIScreen.main.bounds.height*0.3)
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                DotsAnimationViewControllerRepresentable()
                    .frame(height: DotsAnimationParams.amplitude, alignment: .center)
                    .padding(.bottom, UIScheme.dimension.middleSpacing)
                    .opacity(animationState.showDots ? 1 : 0)
                Text(L.title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
                    .offset(x: .zero, y: animationState.titleOffset)
                    .opacity(animationState.showTitle ? 1 : 0)
                Text(L.sub_title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
                    .offset(x: .zero, y: animationState.subtitleOffset)
                    .opacity(animationState.showSubtitle ? 1 : 0)
            }
            LinkButton(
                text: L.title_cancel_payment.string,
                fontSize: UIScheme.dimension.smallFont,
                foregroundColor: UIScheme.color.cancelPaymentButtonColor
            ) {
                cancelAction()
            }.padding(.top, UIScheme.dimension.cancelButtonLoadingSubtitleSpacing)
                .opacity(animationState.showButton ? 1 : 0)
            Spacer()
            FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            animateViews()
        }
    }

    private func animateViews() {
        withAnimation(fastInSlowOutEasing()) {
            animationState.showDots.toggle()
        }
        
        withAnimation(fastInSlowOutEasing().delay(0.5)) {
            animationState.titleOffset = .zero
            animationState.showTitle.toggle()
        }

        withAnimation(fastInSlowOutEasing().delay(0.8)) {
            animationState.subtitleOffset = .zero
            animationState.showSubtitle.toggle()
        }

        withAnimation(fastInSlowOutEasing().delay(1.3)) {
            animationState.showButton.toggle()
        }
    }
    
    private func fastInSlowOutEasing(duration: CGFloat = 0.5) -> Animation {
        Animation.timingCurve(0.4, 0, 0.2, 1, duration: duration)
    }
}

fileprivate final class DotsAnimationViewController: UIViewController {

    private let stackView: UIStackView = {
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = DotsAnimationParams.dotSpacing
        return $0
    }(UIStackView())

    private let circleA = UIView()
    private let circleB = UIView()
    private let circleC = UIView()
    private lazy var circles = [circleA, circleB, circleC]

    func animate() {
        let jumpDuration: Double = DotsAnimationParams.jumpDuration
        let delayDuration: Double = DotsAnimationParams.delayDuration
        let totalDuration: Double = jumpDuration*4

        let jumpRelativeDuration: Double = jumpDuration / totalDuration
        let jumpRelativeTime: Double = 0
        let fallRelativeTime: Double = jumpDuration*3 / totalDuration

        for (index, circle) in circles.enumerated() {
            let delay = delayDuration * TimeInterval(index) / TimeInterval(circles.count)
            UIView.animateKeyframes(withDuration: totalDuration, delay: delay, options: [.repeat, .calculationModeCubic], animations: {
                UIView.addKeyframe(withRelativeStartTime: jumpRelativeTime, relativeDuration: jumpRelativeDuration) {
                    circle.frame.origin.y -= DotsAnimationParams.amplitude / 2
                }
                UIView.addKeyframe(withRelativeStartTime: fallRelativeTime, relativeDuration: jumpRelativeDuration) {
                    circle.frame.origin.y += DotsAnimationParams.amplitude / 2
                }
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circles.forEach {
            $0.layer.cornerRadius =  DotsAnimationParams.dotSize/2
            $0.layer.masksToBounds = true
            $0.backgroundColor = {
                if let cgColor = UIScheme.color.brandColor.cgColor {
                    return UIColor(cgColor: cgColor)
                }
                return .white
            }()
            stackView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalToConstant: DotsAnimationParams.dotSize).isActive = true
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor).isActive = true
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}

fileprivate struct DotsAnimationViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DotsAnimationViewController {
        DotsAnimationViewController()
    }

    func updateUIViewController(_ uiViewController: DotsAnimationViewController, context: Context) {}
}

#if DEBUG

struct LoadingScreen_Previews: PreviewProvider {

    static var previews: some View {
        LoadingScreen(viewModel: LoadingScreenViewModel(parentViewModel: MockRootViewModel(with: stateMock)))
    }
}

#endif
