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

fileprivate struct DotsAnimationParams {
    static let dotSize: CGFloat = 12
    static var dotSpacing: CGFloat { dotSize }
    static var amplitude: CGFloat { dotSize * 2 }
    static var jumpDuration: Double = 0.3
    static var delayDuration: Double = 0.3
}

struct LoadingScreen<VM: LoadingScreenViewModelProtocol>: View, ViewWithViewModel {
    @ObservedObject var viewModel: VM

    public var body: some View {
        VStack {
            HStack(spacing: 0) {
                Spacer()
                CloseButton {
                    viewModel.dispatch(intent: .close)
                }
                .padding(UIScheme.dimension.largeSpacing)
            }
            Spacer()
            VStack(spacing: UIScheme.dimension.middleSpacing) {
                DotsAnimationViewController()
                    .frame(height: DotsAnimationParams.amplitude, alignment: .center)
                    .padding(.bottom, UIScheme.dimension.middleSpacing)
                Text(L.title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.biggerFont))
                    .foregroundColor(UIScheme.color.text)
                Text(L.sub_title_loading_screen.string)
                    .font(UIScheme.font.commonRegular(size: UIScheme.dimension.smallFont))
                    .foregroundColor(UIScheme.color.text)
            }
            Spacer()
            FooterView().padding(.bottom, UIScheme.dimension.largeSpacing)
        }
        .frame(maxWidth: .infinity)
    }
}

final class DotsAnimationViewController: UIViewController {

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
        let totalDuration: Double = delayDuration + jumpDuration*2

        let jumpRelativeDuration: Double = jumpDuration / totalDuration
        let jumpRelativeTime: Double = delayDuration / totalDuration
        let fallRelativeTime: Double = (delayDuration + jumpDuration) / totalDuration

        for (index, circle) in circles.enumerated() {
            let delay = jumpDuration*2 * TimeInterval(index) / TimeInterval(circles.count)
            UIView.animateKeyframes(withDuration: totalDuration, delay: delay, options: [.repeat, .calculationModeLinear], animations: {
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

extension DotsAnimationViewController: UIViewControllerRepresentable {
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
