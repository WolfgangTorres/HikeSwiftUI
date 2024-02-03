//
//  CustomListRowView.swift
//  Hike
//
//  Created by Andres Torres on 27/12/23.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK: Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent = self.rowContent {
                Text(rowContent)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if let linkLabel = self.rowLinkLabel,
                      let linkDestination = self.rowLinkDestination {
                Link(linkLabel, destination: URL(string: linkDestination)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(self.rowTintColor)
                    Image(systemName: self.rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(self.rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(
                rowLabel: "Website",
                rowIcon: "globe",
                rowContent: nil,
                rowTintColor: .pink,
                rowLinkLabel: "Credo Academy",
                rowLinkDestination: "https://credo.academy")
        }
    }
}
