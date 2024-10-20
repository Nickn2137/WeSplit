import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0.0
    @State private var numPeople = ""
    
    let tips = [10, 15, 20, 25, 0]
    @State var selectedTip = 15

    var total: Double {
        let tipPercentage = Double(selectedTip) / 100.0
        return amount * (1 + tipPercentage)
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numPeople) ?? 1
        return total / peopleCount
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 18/255, green: 18/255, blue: 18/255).ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("WeSplit")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.bottom, -25.0)
                    Form {
                        Section("") {
                            TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .keyboardType(.decimalPad)
                            
                            TextField("Number of people", text: $numPeople)
                                .keyboardType(.numberPad)
                        }
                        .colorInvert()
                        .listRowBackground(Color(red: 28/255, green: 28/255, blue: 30/255))
                        
                        Section(header: Text("How much tip do you want to leave?").foregroundColor(Color(red: 117/255, green: 117/255, blue: 113/255))) {
                            Picker("Tip percentage", selection: $selectedTip) {
                                ForEach(tips, id: \.self) {
                                    Text($0, format: .percent)
                                }
                            }
                            .pickerStyle(.segmented)
                            .colorInvert()
                            .listRowBackground(Color(red: 28/255, green: 28/255, blue: 30/255))
                        }
                        
                        Section(header: Text("Total Amount")) {
                            Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .colorInvert()
                        .listRowBackground(Color(red: 28/255, green: 28/255, blue: 30/255))
                        
                        Section("Amount per person") {
                            Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                        .colorInvert()
                        .listRowBackground(Color(red: 28/255, green: 28/255, blue: 30/255))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
