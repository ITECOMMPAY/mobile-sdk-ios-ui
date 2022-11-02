//
//  RecurrentSettingsScreen.swift
//  EcommpaySample
//
//  Created by Ivan Krapivtsev on 31.10.2022.
//

import Foundation
import SwiftUI

struct RecurrentData {
    var register: Bool = true
    var type: String?
    var expiryDay: String?
    var expiryMonth: String?
    var expiryYear: String?
    var period: String?
    var time: String?
    var startDate: String?
    var scheduledPaymentID: String?
    var amount: Int?
    var schedule: [RecurrentDataSchedule] = []

    static var mockData: RecurrentData {
        RecurrentData(register: true,
                      type: "R",
                      expiryDay: "06",
                      expiryMonth: "11",
                      expiryYear: "2026",
                      period: "M",
                      time: "12:00:00",
                      startDate: "12-10-2022",
                      scheduledPaymentID: getUniqueScheduledID(),
                      amount: 1000,
                      schedule: [RecurrentDataSchedule.random])
    }
}

struct RecurrentDataSchedule: Identifiable {
    let id = UUID()
    var date: String?
    var amount: Int?

    static var random: RecurrentDataSchedule {
        RecurrentDataSchedule(
            date: "10-08-202\(Int.random(in: 0...9))",
            amount: Int.random(in: 1000...2000)
        )
    }
}

struct RecurrentSettingsScreen: View {
    @Binding var shouldSend: Bool
    @Binding var recurrentData: RecurrentData

    var body: some View {
        Form {
            Section {
                Toggle("Send recurent data", isOn: $shouldSend)
            }
            Section(header: HStack {
                Text("Recurrent settings")
                Spacer()
                Spacer()
                Button("Load defaults") {
                    recurrentData = RecurrentData.mockData
                }
            }) {
                FieldWithLabel(label: "Type") {
                    TextField(" R/C/U/I", text: $recurrentData.type.flatten())
                }
                FieldWithLabel(label: "Expiry day") {
                    TextField("DD", text: $recurrentData.expiryDay.flatten())
                }
                FieldWithLabel(label: "Expiry month") {
                    TextField("MM", text: $recurrentData.expiryMonth.flatten())
                }
                FieldWithLabel(label: "Expiry year") {
                    TextField("YYYY", text: $recurrentData.expiryYear.flatten())
                }
                FieldWithLabel(label: "Period") {
                    TextField("Day/Week/Month/Quarter/Year", text: $recurrentData.period.flatten())
                }
                FieldWithLabel(label: "Time") {
                    TextField("time", text: $recurrentData.time.flatten())
                }
                FieldWithLabel(label: "Start date") {
                    TextField("DD-MM-YYYY", text: $recurrentData.startDate.flatten())
                }
                FieldWithLabel(label: "Scheduled\n Payment ID") {
                    TextField("uniq ID", text: $recurrentData.scheduledPaymentID.flatten())
                }
                FieldWithLabel(label: "Amount") {
                    TextField("integer number", text: $recurrentData.amount.flattenAsString())
                }
            }
            Section(header: HStack {
                Text("Recurrent schedule")
                Spacer()
                Button("Add") {
                    recurrentData.schedule = recurrentData.schedule + [RecurrentDataSchedule.random]
                }
            }) {
                ForEach($recurrentData.schedule) { item in
                    VStack {
                        FieldWithLabel(label: "Date") {
                            TextField("DD-MM-YYYY", text: item.date.flatten())
                        }
                        FieldWithLabel(label: "Amount") {
                            TextField("Integer value", text: item.amount.flattenAsString())
                        }
                        Button("Delete") {
                            recurrentData.schedule = recurrentData.schedule.filter({ $0.id == item.wrappedValue.id })
                        }
                    }
                }
            }
        }
        .navigationTitle("Recurrent Data")
        .toolbar {
            Button("Clear") {
                recurrentData = RecurrentData()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FieldWithLabel<FieldType: View>: View {
    let label: String
    let field: () -> FieldType

    var body: some View {
        HStack {
            Text(label).foregroundColor(Color.secondary)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            field()
            .multilineTextAlignment(.trailing)
        }
    }
}

extension Binding where Value == String? {
    func flatten(defaultValue: String = "") -> Binding<String> {
        Binding<String>(
            get: { wrappedValue ?? defaultValue },
            set: { wrappedValue = $0 }
        )
    }
}

extension Binding where Value == Int? {
    func flattenAsString() -> Binding<String> {
        Binding<String>(
            get: { wrappedValue.map {"\($0)"} ?? "" },
            set: {  wrappedValue = Int($0) }
        )
    }
}

#if DEBUG

struct RecurrentSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecurrentSettingsScreen(shouldSend: .mutable(false),
                                    recurrentData: .mutable(RecurrentData.mockData))
        }

    }
}

#endif
