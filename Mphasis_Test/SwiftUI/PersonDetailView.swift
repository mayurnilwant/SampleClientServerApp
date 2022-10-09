//
//  PersonDetailView.swift
//  Mphasis_Test
//
//  Created by Mayur Nilwant on 09/10/2022.
//

import SwiftUI

struct PersonDetailView: View {
    
    let person: Person?
    
    @available(iOS 13.0.0, *)
    var body: some View {
        
        List {
            if let personInfoArray = person?.getPersonInfoArray() {
                ForEach(personInfoArray, id: \.id) { person in
                  
                            PersonCellView(withPeron: person)
                    }
                }
            else {
                EmptyView()
                }
            }
    }
}



struct PersonCellView: View {
    
    let person: GenericDisplayModal
    
    init(withPeron person: GenericDisplayModal) {
        self.person = person
    }
    @available(iOS 13.0.0, *)
    var body: some View {
        
        
        VStack(alignment: .leading,spacing: 15.0) {
                Text("\(person.title)")
                .font(.system(.headline))
                Text("\(person.subtitle)")
                .font(.system(.subheadline))
            }
            .foregroundColor(UIColor.appThemeColor.suColor)
    }
}

