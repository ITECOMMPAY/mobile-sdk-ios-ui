//
//  RecurrentSettingsScreen.swift
//  MglwalletSample
//
//  Created by Ivan Krapivtsev on 31.10.2022.
//

import Foundation
import SwiftUI

struct RecurrentData {
    var register: Bool
    var type: String?
    var expiryDay: String?
    var expiryMonth: String?
    var expiryYear: String?
    var period: String?
    var interval: Int?
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
                      interval: 1,
                      time: "12:00:00",
                      startDate: "12-10-2023",
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
                    .accessibilityIdentifier("recurrentEnabledCheckbox")
            }
            Section(header: HStack {
                Text("Recurrent settings")
                    .accessibilityIdentifier("RecurrentScreenTitleText")
                Spacer()
                Spacer()
                Button("Load defaults") {
                    recurrentData = RecurrentData.mockData
                }
                .accessibilityIdentifier("recurrentFillMockDataButton")
            }) {
                Toggle("Register recurring", isOn: $recurrentData.register)
                FieldWithLabel(label: "Type") {
                    TextField(" R/C/U/I", text: $recurrentData.type.flatten())
                        .accessibilityIdentifier("recurrentTypeTextField")
                }
                FieldWithLabel(label: "Expiry day") {
                    TextField("DD", text: $recurrentData.expiryDay.flatten())
                        .accessibilityIdentifier("recurrentExpiryDayTextField")
                }
                FieldWithLabel(label: "Expiry month") {
                    TextField("MM", text: $recurrentData.expiryMonth.flatten())
                        .accessibilityIdentifier("recurrentExpiryMonthTextField")
                }
                FieldWithLabel(label: "Expiry year") {
                    TextField("YYYY", text: $recurrentData.expiryYear.flatten())
                        .accessibilityIdentifier("recurrentExpiryYearTextField")
                }
                Group {
                    FieldWithLabel(label: "Period") {
                        TextField("Day/Week/Month/Quarter/Year", text: $recurrentData.period.flatten())
                            .accessibilityIdentifier("recurrentPeriodTextField")
                    }
                    FieldWithLabel(label: "Interval") {
                        TextField("integer number", text: $recurrentData.interval.flattenAsString())
                            .accessibilityIdentifier("recurrentIntervalTextField")
                    }
                }
                FieldWithLabel(label: "Time") {
                    TextField("time", text: $recurrentData.time.flatten())
                        .accessibilityIdentifier("recurrentTimeTextField")
                }
                FieldWithLabel(label: "Start date") {
                    TextField("DD-MM-YYYY", text: $recurrentData.startDate.flatten())
                        .accessibilityIdentifier("recurrentStartDateTextField")
                }
                FieldWithLabel(label: "Scheduled\n Payment ID") {
                    TextField("uniq ID", text: $recurrentData.scheduledPaymentID.flatten())
                        .accessibilityIdentifier("recurrentSchedulePaymentIdTextField")
                }
                FieldWithLabel(label: "Amount") {
                    TextField("integer number", text: $recurrentData.amount.flattenAsString())
                        .accessibilityIdentifier("recurrentAmountTextField")
                }
            }
            Section(header: HStack {
                Text("Recurrent schedule")
                    .accessibilityIdentifier("recurrentScheduleTitleText")
                Spacer()
                Button("Add") {
                    recurrentData.schedule = recurrentData.schedule + [RecurrentDataSchedule.random]
                }
                .accessibilityIdentifier("recurrentAddScheduleButton")
            }) {
                ForEach(recurrentData.schedule.indices, id: \.self) { index in
                    VStack {
                        FieldWithLabel(label: "Date") {
                            TextField("DD-MM-YYYY", text: $recurrentData.schedule[index].date.flatten())
                                .accessibilityIdentifier("recurrentScheduleDate\(index)TextField")
                        }
                        FieldWithLabel(label: "Amount") {
                            TextField("Integer value", text: $recurrentData.schedule[index].amount.flattenAsString())
                                .accessibilityIdentifier("recurrentScheduleAmount\(index)TextField")
                        }
                        Button("Delete") {
                            recurrentData.schedule.remove(at: index)
                        }
                        .accessibilityIdentifier("recurrentDeleteSchedule\(index)Button")
                    }
                }
            }
        }
        .navigationTitle("Recurrent Data")
        .toolbar {
            Button("Clear") {
                recurrentData = RecurrentData(register: true)
            }
            .accessibilityIdentifier("recurrentResetDataButton")
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
            set: { wrappedValue = $0.isEmpty ? nil : $0 }
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
