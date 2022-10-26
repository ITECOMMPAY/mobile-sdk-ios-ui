//
//  ContainerViewController.swift
//  mobileSDK.Facade
//
//  Created by Ivan Krapivtsev on 16.09.2022.
//

import Foundation
import UIKit
import SwiftUI

class ContainerViewController<Content: View>: UIHostingController<Content> {
    override var shouldAutorotate: Bool {
        false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
}
