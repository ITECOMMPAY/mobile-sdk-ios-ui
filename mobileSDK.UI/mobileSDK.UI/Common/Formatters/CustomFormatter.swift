//
//  CustomFormatter.swift
//  mobileSDK.UI
//
//  Created by Ivan Krapivtsev on 12.09.2022.
//

import Foundation

protocol CustomFormatterTransformation {
    func formattedString(from rawString: String) -> String
    func rawString(from formattedString: String) -> String
}

class CustomFormatter: Formatter {

    let transformation: CustomFormatterTransformation
    
    init(transformation: CustomFormatterTransformation) {
        self.transformation = transformation
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overriden methods

    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return transformation.formattedString(from: string)
        }
        return nil
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = transformation.rawString(from: string) as AnyObject
        return true
    }
}
