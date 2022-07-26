//
//  ThreeDSecureViewCell.swift
//  TestClient
//
//  Created by Виталий Морозов on 30.04.2020.
//  Copyright © 2020 Ecommpay. All rights reserved.
//

import UIKit

protocol ThreeDSecureViewCellDelegate: AnyObject {
    func onChangeJson(vo: ThreeDSecureVO)
}

class ThreeDSecureViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var jsonBody: UITextView!

    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var header: UIView!

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var title: UILabel!
    private var vo: ThreeDSecureVO?
    private weak var delegate: ThreeDSecureViewCellDelegate?

    public static let identifier: String = "ThreeDSecureViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
        self.reset.layer.cornerRadius = 9
        self.reset.clipsToBounds = true
        self.clear.layer.cornerRadius = 9
        self.clear.clipsToBounds = true
    }

    func configure(_ vo: ThreeDSecureVO, _ delegate: ThreeDSecureViewCellDelegate?) {
        self.vo = vo
        self.title.text = vo.type
        if let json = vo.json {
            self.jsonBody.text = json
        } else {
            self.jsonBody.text = vo.defaultJson
            self.vo?.json = vo.defaultJson
        }
        self.jsonBody.delegate = self
        self.delegate = delegate
        jsonBody.isScrollEnabled = false
        resize(textView: jsonBody)
    }

    @IBAction func onReset(_ sender: Any) {
        self.jsonBody.text = self.vo?.defaultJson
        resize(textView: self.jsonBody)
    }

    @IBAction func onClear(_ sender: Any) {
        self.jsonBody.text = ""
        self.vo?.json = ""
        resize(textView: self.jsonBody)
    }

    fileprivate func resize(textView: UITextView) {
        var newFrame = textView.frame
        let width = newFrame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: width,
                                                   height: CGFloat.greatestFiniteMagnitude))
        newFrame.size = CGSize(width: width, height: newSize.height)
        textView.frame = newFrame
    }

    func textViewDidChange(_ textView: UITextView) {
        if let vo = self.vo {
            if !textView.text.isEmpty {
                vo.json = textView.text
                resize(textView: self.jsonBody)
                self.delegate?.onChangeJson(vo: vo)
            }
        }
    }
}
