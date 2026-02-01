//
//  SettingsView.swift
//  MenuDo
//

import SwiftUI

/// 外观选项：浅色 / 深色
private enum AppearanceOption: String, CaseIterable {
    case light = "light"
    case dark = "dark"

    var title: String {
        switch self {
        case .light: return "浅色"
        case .dark: return "深色"
        }
    }
}

/// 字体大小选项
private enum FontSizeOption: String, CaseIterable {
    case small = "small"
    case medium = "medium"
    case large = "large"

    var title: String {
        switch self {
        case .small: return "小"
        case .medium: return "中"
        case .large: return "大"
        }
    }
}

/// 设置页：外观、字体大小等（与主界面通过 @AppStorage 同步）
struct SettingsView: View {
    @AppStorage("menudo_appearance") private var appearanceRaw: String = AppearanceOption.dark.rawValue
    @AppStorage("menudo_fontSize") private var fontSizeRaw: String = FontSizeOption.medium.rawValue

    var body: some View {
        Form {
            Section("外观") {
                Picker("主题", selection: $appearanceRaw) {
                    ForEach(AppearanceOption.allCases, id: \.rawValue) { opt in
                        Text(opt.title).tag(opt.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }

            Section("显示") {
                Picker("字体大小", selection: $fontSizeRaw) {
                    ForEach(FontSizeOption.allCases, id: \.rawValue) { opt in
                        Text(opt.title).tag(opt.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .formStyle(.grouped)
        .frame(minWidth: 320, minHeight: 180)
    }
}

#Preview {
    SettingsView()
}
