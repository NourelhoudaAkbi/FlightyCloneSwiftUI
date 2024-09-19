//
//  UIModel.swift
//  FlightyCloneSwiftUI
//
//  Created by Nour el houda Akbi on 19/9/2024.
//
import SwiftUI

class UIModel: ObservableObject {
    @Published var selectedDetent: PresentationDetent = .height(200)
}
