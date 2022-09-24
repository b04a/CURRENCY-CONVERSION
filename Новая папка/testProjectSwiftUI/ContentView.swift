//
//  ContentView.swift
//  testProjectSwiftUI
//
//  Created by Danil Bochkarev on 21.09.2022.
//

//apiKey = D9ChknziARuFqLT43So7jZolLrMB0KYC

import SwiftUI

struct ContentView: View {
    var colors = ["RUB", "USD", "EUR", "GBP", "BYN"]
    @State var numberTest = "RESULT"
    @State private var selectedColor = "RUB"
    @State private var selectedColor1 = "USD"
    @State private var valueOne: String = ""
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("CURRENCY CONVERSION")
                    .frame(width: 400, height: 200)
                    .font(.system(size: 55, weight: .bold, design: .default))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.all, 15)
                    .foregroundColor(.white)
                Spacer()
                
                
                VStack(spacing: 35) {
                    //MARK: - Первая информация (ввод и выбор валюты)
                    VStack(spacing: 15) {
                        HStack(spacing: 5) {
                            Text("I HAVE")
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .frame(width: 100)
                                .background(Color.white)
                                .cornerRadius(12)
                            
                            TextField("ENTER NUMBER", text: $valueOne)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 250, height: 30)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 21, weight: .bold, design: .default))
                            .cornerRadius(15)
                        }
                        
                        HStack {
                            Picker("Please choose a color", selection: $selectedColor) {
                                ForEach(colors, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.white)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                            //Text("You selected: \(selectedColor)")
                        }.frame(width: 350, height: 25)
                    }
                    
                    VStack {
                        Image(systemName: "repeat")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 50)
                    }
                    
                    //MARK: - Вторая информация (ввод и выбор валюты)
                    VStack {
                        VStack(spacing: 15) {
                            HStack(spacing: 10) {
                                Text("I WANT TO GET IT ")
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .lineLimit(1)
                                    .frame(width: 350)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .multilineTextAlignment(.center)
                            }
                            
                            HStack {
                                Picker("Please choose a color", selection: $selectedColor1) {
                                    ForEach(colors, id: \.self) {
                                        Text($0)
                                            .foregroundColor(.white)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }.frame(width: 350, height: 25)
                        }
                    }
                    
                    VStack {
                        Button {
                            numberTest = "PLS WAIT"
                            
                            Api().getPosts(valueOne: valueOne, selectedColor: selectedColor, selectedColor1: selectedColor1) { currentResult in
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    numberTest = currentResult.suka
                                }
                            }
                             //currentDataApi.result
                            
                            
                        } label: {
                            Text("CONVERT")
                                .frame(width: 200)
                                .foregroundColor(.black)
                                .font(.system(size: 35, weight: .bold, design: .default))
                                .background(Color.white)
                                .cornerRadius(12)
                        } .padding()
                    }
                    
                    HStack {
                        Image(systemName: "creditcard")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 65)
                        
                        Text("\(numberTest)")
                            .frame(width: 200, height: 45)
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .background(Color.white)
                            .cornerRadius(12)


                        Image(systemName: "creditcard")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 65)
                    }
                }
                Spacer().padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


