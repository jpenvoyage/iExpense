//
//  ContentView.swift
//  iExpense
//
//  Created by Joao Leal on 2/15/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var expenses = Expenses()
    var body: some View {
        NavigationStack{
            
            List{
                ForEach(expenses.items) { item in
                    
                    HStack {
                        VStack(alignment: .leading)  {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                    
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                    }
                    
                .onDelete(perform: removeItem)
                        
                }
                
            
            .navigationTitle("Xpenses")
            .toolbar {
                NavigationLink(destination: AddView(expenses: expenses)){ Image(systemName: "plus")
                }
                
            }
            

        }
    }
    func removeItem (at offsets: IndexSet ) {
        expenses.items.remove(atOffsets: offsets)
    }
}
#Preview {
    ContentView()
}
