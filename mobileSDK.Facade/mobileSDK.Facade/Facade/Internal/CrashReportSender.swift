//
//  CrashReportSender.swift
//  mobileSDK.Facade
//
//  Created by Artem Serebrennikov on 11.01.2023.
//

//import Foundation
//#if !targetEnvironment(simulator)
//internal import KSCrash
//#endif
//#if !DEVELOPMENT
//internal import MsdkCore
//#else
//import MsdkCore
//#endif
//
//internal class CrashReportSender {
//    private var errorInteractor: ErrorEventInteractor?
//
//    static let shared = CrashReportSender()
//
//    private init() { }
//
//    func start(
//        projectId: Int?,
//        paymentId: String?,
//        customerId: String?,
//        signature: String?,
//        errorInteractor: ErrorEventInteractor
//    ) {
//        #if !targetEnvironment(simulator)
//        KSCrashInstallationConsole.sharedInstance().install()
//        
//        self.errorInteractor = errorInteractor
//
//        #if DEVELOPMENT
//        KSCrashInstallationConsole.sharedInstance().isMuted = false
//        #else
//        KSCrashInstallationConsole.sharedInstance().isMuted = true
//        #endif
//
//        let crashUserInfo = CrashUserInfo(
//            projectId: projectId,
//            paymentId: paymentId,
//            customerId: customerId,
//            signature: signature
//        )
//        KSCrash.sharedInstance().userInfo = crashUserInfo.dictionary
//        KSCrash.sharedInstance().deleteBehaviorAfterSendAll = .init(rawValue: 0)
//        KSCrash.sharedInstance().maxReportCount = 1
//        KSCrashInstallationConsole.sharedInstance().printAppleFormat = false
//        KSCrashInstallationConsole.sharedInstance().sendAllReports  { [weak self] (reports, completed, error) -> Void in
//            if let reports = reports {
//                self?.sendCrashReports(reports)
//            }
//        }
//        #endif
//    }
//
//    internal func stop() {
//        #if !targetEnvironment(simulator)
//        KSCrash.sharedInstance().monitoring = .init(rawValue: 0)
//        #endif
//    }
//
//    private func sendCrashReports(_ reports: [Any]) {
//
//        let parsedReports = reports
//            .compactMap({ $0 as? String })
//            .compactMap({ SavedCrashReport.from(string: $0) })
//        let dispatchGroup = DispatchGroup()
//        DispatchQueue.main.async { [weak self] in
//            parsedReports.forEach({ savedCrashReport in
//                dispatchGroup.wait()
//                dispatchGroup.enter()
//                self?.sendCrashReport(savedCrashReport) { success in
//                    dispatchGroup.leave()
//                    print("Report is \(success ? "" : "not") sent")
//                    #if !targetEnvironment(simulator)
//                    if success {
//                        KSCrash.sharedInstance().deleteAllReports()
//                    }
//                    #endif
//                }
//            })
//        }
//    }
//
//    private func sendCrashReport(_ report: SavedCrashReport, completed: @escaping (_ success: Bool) -> Void ) {
//        guard let errorInteractor = errorInteractor else {
//            completed(false)
//            return
//        }
//        
//        let version = Bundle(for: CrashReportSender.self).infoDictionary?["CFBundleVersion"] as? String
//        
//        let request = ErrorEventRequest(
//            version: version,
//            device: (report.system.machine?.appending(";") ?? "") + (report.system.system_version ?? ""),
//            model: report.system.model,
//            manufacturer: "Apple",
//            versionCode: nil,
//            exceptionName: report.compactCrashDescription,
//            exceptionDescription: report.compactBacktraceDescription.map({ String($0.prefix(500)) }),
//            projectId: KotlinLong(integerLiteral: Int(report.user.projectId ?? 0)),
//            paymentId: report.user.paymentId,
//            customerId: report.user.customerId,
//            signature: report.user.signature
//        )
//        
//        errorInteractor.execute(request: request, callback: ErrorInteractorDelegate(callback: completed))
//    }
//}
//
//private class ErrorInteractorDelegate: ErrorEventDelegate {
//    let callback: ((Bool) -> Void)?
//    
//    init(callback: ((Bool) -> Void)?) {
//        self.callback = callback
//    }
//
//    func onSuccess() {
//        callback?(true)
//    }
//
//    func onError(code: ErrorCode, message: String) {
//        callback?(false)
//    }
//}
//
//private struct CrashUserInfo: Codable {
//    var projectId: Int?
//    var paymentId: String?
//    var customerId: String?
//    var signature: String?
//
//    var dictionary: [String: Any]? {
//        guard let data = try? JSONEncoder().encode(self) else { return nil }
//        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
//    }
//}
//
//private struct SavedCrashReport: Codable {
//    var binary_images: [BinaryImage]
//    var crash: Crash
//    var system: System
//    var user: CrashUserInfo
//
//    static func from(string: String) -> SavedCrashReport? {
//        guard let data = string.data(using: .utf8) else { return nil }
//        return try? JSONDecoder().decode(SavedCrashReport.self, from: data)
//    }
//}
//
//private extension SavedCrashReport {
//    struct BinaryImage: Codable {
//        var image_addr: Int64
//        var name: String
//        var uuid: String // uuid - точная версия бинарника, её необходимо иметь в наличии чтобы символивицировать адрес
//        var crash_info_message: String?
//    }
//
//    struct Crash: Codable {
//        var error: Error?
//        var threads: [Thread]
//    }
//
//    struct System: Codable {
//        var machine: String?
//        var system_version: String?
//        var model: String?
//    }
//}
//
//private extension SavedCrashReport.Crash {
//    struct Error: Codable {
//        var address: Int64?
//        var mach: Mach?
//    }
//
//    struct Thread: Codable {
//        var backtrace: Backtrace
//        var crashed: Bool
//    }
//}
//
//private extension SavedCrashReport.Crash.Error {
//    struct Mach: Codable {
//        var code: Int64
//        var code_name: String?
//        var exception_name: String?
//    }
//
//    struct Signal: Codable {
//        var name: String?
//        var signal: Int64
//    }
//}
//
//private extension SavedCrashReport.Crash.Thread {
//    struct Backtrace: Codable {
//        var contents: [Content]
//    }
//}
//
//private extension SavedCrashReport.Crash.Thread.Backtrace {
//    struct Content: Codable {
//        var instruction_addr: Int64?
//        var object_addr: Int64?
//        var object_name: String?
//        var symbol_addr: Int64?
//        var symbol_name: String?
//    }
//}
//
//private extension SavedCrashReport {
//    var compactCrashDescription: String {
//        return (crash.error?.mach?.code_name?.appending(";") ?? "").appending(crash.error?.mach?.exception_name ?? "")
//        + (binary_images.compactMap({ binaryImage in
//            if let crashInfo = binaryImage.crash_info_message {
//                return ";" + crashInfo
//            } else {
//                return nil
//            }
//        }).first ?? "")
//    }
//}
//
//private extension SavedCrashReport {
//    var compactBacktraceDescription: String? {
//        guard let crashedThread = self.crash.threads.first(where: { thread in
//            thread.crashed
//        }) else { return nil }
//
//        return crashedThread.backtrace.contents.compactMap { backtraceContent -> BacktraceItem? in
//            if let symbolName = backtraceContent.symbol_name, symbolName != "<redacted>" {
//                return BacktraceItem.withSymbol((backtraceContent.object_name?.appending(".") ?? "") + symbolName)
//            } else if let binaryImageAddress = backtraceContent.object_addr,
//                      let binaryImageName = backtraceContent.object_name,
//                      let instructionAddress = backtraceContent.instruction_addr {
//                return BacktraceItem.onlyAddress(object_name: binaryImageName,
//                                                 object_addr: binaryImageAddress,
//                                                 instruction_addr: instructionAddress)
//            } else {
//                return nil
//            }
//        }
//        .map {
//            $0.asString
//        }
//        .joined(separator: ";")
//    }
//}
//
//private enum BacktraceItem {
//    case withSymbol(String)
//
//    /// To simbolificate this item use "atos" command
//    /// - details described here: https://developer.apple.com/documentation/xcode/adding-identifiable-symbol-names-to-a-crash-report
//    /// - note: it be successful only if udids of binary images is the same as on local machine
//    case onlyAddress(object_name: String, object_addr: Int64, instruction_addr: Int64)
//
//    var asString: String {
//        switch self {
//        case .withSymbol(let string):
//            return string
//        case .onlyAddress(let object_addr, let object_name, let instruction_addr):
//            return "\(object_name),\(object_addr),\(instruction_addr)"
//        }
//    }
//}

