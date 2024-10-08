//
//  DepartureAndArrivalDetails.swift
//  FlightyCloneSwiftUI
//
//  Created by Nour el houda Akbi on 20/9/2024.
//
import SwiftUI

struct DepartureAndArrivalDetails: View {
    @State private var sectionHeight: CGFloat = 0
    @State private var departurePosition: CGFloat = 0
    @State private var arrivalPosition: CGFloat = 0
    @State private var departureIcon: CGFloat = 0
    @State private var arrivalIcon: CGFloat = 0

    var body: some View {
        HStack(alignment: .top) {
            // Departure/Arrival Arrows
            ZStack {
                Image(systemName: "arrow.up.right.circle.fill")
                    .foregroundStyle(.background, .green)
                    .background(
                        Circle()
                            .fill(.background)
                    )
                    .offset(y: departurePosition - 10)

                Image(systemName: "arrow.down.right.circle.fill")
                    .foregroundStyle(.background, .green)
                    .background(
                        Circle()
                            .fill(.background)
                    )
                    .offset(y: arrivalPosition - 10)
            }
            .fontWeight(.bold)
            .background(
                Rectangle()
                    .frame(width: 0.5, alignment: .center)
                    .frame(height: arrivalPosition - 10 - 10)
                    .offset(y: departurePosition)
                    .foregroundStyle(.primary.opacity(0.25)),
                alignment: .top
            )

            VStack {
                // Departure details.
                HStack {
                    Text("ATL")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
                        .overlay(
                            Rectangle()
                                .fill(.clear)
                                .frame(height: 0.5)
                                .overlay(
                                    GeometryReader { proxy in
                                        Color.clear.preference(key: TextCenter.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).midY)
                                    }
                                )
                                .onPreferenceChange(TextCenter.self) { offset in
                                    departurePosition = offset
                                }
                        )
                    Spacer()
                    Text("8:20 pm")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.semibold))
                        .textCase(.uppercase)
                        .foregroundStyle(.green)
                }

                Group {
                    HStack {
                        Text("Hartsfield Jackson Atlanta Intl")
                            .font(.caption.weight(.regular))
                        Spacer()
                        Text("Scheduled")
                            .font(.caption.weight(.bold))
                    }

                    HStack {
                        Text("Terminal 3 • Gate 4B")
                            .font(.caption.weight(.bold))
                        Spacer()
                        Text("in 1h 16m")
                            .font(.caption.weight(.regular))
                    }
                }
                .foregroundStyle(.secondary)

                ZStack {
                    Rectangle().frame(height: 0.5).opacity(0.15)
                    Text("Total 2h 6m • 606 mi")
                        .font(.caption.weight(.regular))
                        .foregroundStyle(.secondary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 3)
                        .background(.background)
                }

                VStack {
                    // Arrival details.
                    HStack {
                        Text("ORD")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.bold))
                            .overlay(
                                Rectangle()
                                    .fill(.clear)
                                    .frame(height: 0.5)
                                    .overlay(
                                        GeometryReader { proxy in
                                            Color.clear.preference(key: TextCenter.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).midY)
                                        }
                                    )
                                    .onPreferenceChange(TextCenter.self) { offset in
                                        arrivalPosition = offset
                                    }
                            )

                        Spacer()
                        Text("9:26 pm")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.semibold))
                            .textCase(.uppercase)
                            .foregroundStyle(.green)
                    }

                    Group {
                        HStack {
                            Text("Chicago O'Hare Intl")
                                .font(.caption.weight(.regular))
                            Spacer()
                            Text("Scheduled")
                                .font(.caption.weight(.bold))
                        }

                        HStack {
                            Text("Terminal 3 • Gate 4B")
                                .font(.caption.weight(.bold))
                            Spacer()
                            Text("in 1h 16m")
                                .font(.caption.weight(.regular))
                        }

                        Text("Baggage Belt: 8")
                            .font(.caption.weight(.regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundStyle(.secondary)
                }

            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity)
        .overlay(
            GeometryReader { proxy in
                Color.clear.preference(key: SectionHeight.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).midY)
            }
        )
        .onPreferenceChange(SectionHeight.self) { value in
            sectionHeight = value
        }
        .coordinateSpace(name: "DepartureAndArrivalDetailsSection")
        .padding(.leading, 10)
        .padding(.trailing)
        .padding(.bottom, 20)
    }
}

#Preview {
    DepartureAndArrivalDetails()
}


struct TextCenter: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue = CGFloat.zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct SectionHeight: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue = CGFloat.zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}


#Preview {
    DepartureAndArrivalDetails()
}



