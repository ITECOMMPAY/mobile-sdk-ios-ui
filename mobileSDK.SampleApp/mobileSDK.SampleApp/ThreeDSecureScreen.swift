//
//  ThreeDSecureScreen.swift
//  EtoedtoSample
//
//  Created by Ivan Krapivtsev on 01.11.2022.
//

import SwiftUI

struct ThreeDSecureScreen: View {
    @Environment(\.presentationMode) var presentation

    let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [ .prettyPrinted, .sortedKeys ]
        return encoder
    }()

    @State var threeDSecureInfo: ThreeDSecureInfo = ThreeDSecureInfo.default {
        didSet {
            if let data = try? jsonEncoder.encode(threeDSecureInfo) {
                threeDSecureInfoJson = String(data: data, encoding: .utf8) ?? "failed to encode"
            }
        }
    }

    var onSave: (ThreeDSecureInfo) -> Void = { _ in }

    @State var threeDSecureInfoJson: String = ""

    @State var decodingError: String?

    @State var showEditActions: Bool = false

    var body: some View {
        Form {
            JsonPartCell(header: "Secure info",
                         json: $threeDSecureInfoJson,
                         leftItem: Button(action: {threeDSecureInfo = ThreeDSecureInfo.default},
                                          label: { Text("Reset")}),
                         rightItem: Button(action: { showEditActions = true },
                                           label: { Text("Edit")}))
        }
        .onAppear { threeDSecureInfo = threeDSecureInfo }
        .navigationTitle("3ds Params")
        .toolbar {
            HStack {
                Button("Save") {
                    do {
                        if let newValue = try threeDSecureInfoJson.data(using: .utf8).map({ data in
                            try JSONDecoder().decode(ThreeDSecureInfo.self, from: data)
                        }) {
                            onSave(newValue)
                            presentation.wrappedValue.dismiss()
                        }
                    } catch let DecodingError.dataCorrupted(context) {
                        setError(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        setError("Key '\(key)' not found:", context.debugDescription)
                        setError("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        setError("Value '\(value)' not found:", context.debugDescription)
                        setError("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context) {
                        setError("Type '\(type)' mismatch:", context.debugDescription)
                        setError("codingPath:", context.codingPath)
                    } catch {
                        setError("error: ", error)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: .constant(decodingError != nil)) {
            Alert(title: Text("JSON Decode Error"),
                  message: decodingError.map(Text.init),
                  dismissButton: .cancel())
        }
        .actionSheet(isPresented: $showEditActions) {
            ActionSheet(
                title: Text("Select item to remove"),
                buttons: [
                    .default(Text("Customer Account")) {
                        threeDSecureInfo.customerAccountInfo = nil
                    },
                    .default(Text("Customer Shipping")) {
                        threeDSecureInfo.customerShipping = nil
                    },
                    .default(Text("Customer Mpi Result")) {
                        threeDSecureInfo.customerMpiResult = nil
                    },
                    .default(Text("Payment Merchant Risk")) {
                        threeDSecureInfo.paymentMerchantRisk = nil
                    },
                    .cancel()
                ]
            )
        }
    }

    func setError(_ items: Any...) {
        decodingError = items.map { String(describing: $0) }.joined(separator: "\n")
    }
}

struct JsonPartCell<LeftItem: View, RightItem: View>: View {
    let header: String
    @Binding var json: String
    let leftItem: LeftItem
    let rightItem: RightItem

    var body: some View {
        Section(header: HStack {
            leftItem
            Spacer()
            Text(header)
            Spacer()
            rightItem
        }) {
            ExpandingTextView(text: $json)
        }
    }

}

#if DEBUG

struct ThreeDSecureScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThreeDSecureScreen()
        }

    }
}

#endif
