//
//  CardView.swift
//  Hike
//
//  Created by Andres Torres on 20/12/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    @State private var randomNumber = 1
    @State private var imageNumber = 1
    @State private var isShowingSheet = false
    
    // MARK: - Functions
    func generateRandomeImage() {
        repeat {
            self.randomNumber = Int.random(in: 1...5)
        } while self.randomNumber == self.imageNumber
                    
        self.imageNumber = self.randomNumber
    }

    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - Header
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show Button Sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - Main content
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(self.imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: self.imageNumber)
                }
                
                // MARK: - Footer
                
                Button {
                    // ACTION: - Generate a random image
                    generateRandomeImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
            } //: VStack
        } //: Card
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
