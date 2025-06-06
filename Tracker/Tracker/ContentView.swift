//
//  ContentView.swift
//  Tracker
//
//  Created by Turma02-11 on 06/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationView{
            ZStack{
                //Estrutura
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Image(systemName: "pill.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .ignoresSafeArea()
                        .shadow(radius: 10, y: -5)
                        .foregroundColor(.mint)
                }.padding(.bottom)
                    .ignoresSafeArea()
                
                //Fim estrutura
                
                //Nova estrutura
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    NavigationLink(destination: AdicionarRemedios(viewModel: viewModel)){
                        //Card 1
                        ZStack{
                            
                            //Fundo
                            RoundedRectangle(cornerRadius: 20)
                                .padding(.top)
                                .ignoresSafeArea()
                                .frame(width: 350, height: 150)
                                .foregroundColor(.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                            
                            //Elementos do card
                            VStack{
                                
                                HStack{
                                    
                                    Image(systemName: "pills.fill")
                                        .resizable()
                                        .padding()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.green)
                                    
                                    Text("Adicionar remédios")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                }
                                
                            }//Elementos card
                        }
                    }
                    
                    NavigationLink(destination: ConsultarRemedios(viewModel: viewModel)){
                        //Card 2
                        ZStack{
                            
                            //Fundo
                            RoundedRectangle(cornerRadius: 20)
                                .padding(.top)
                                .ignoresSafeArea()
                                .frame(width: 350, height: 150)
                                .foregroundColor(.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                            
                            //Elementos do card
                            VStack{
                                
                                HStack{
                                    Image(systemName: "pills.fill")
                                        .resizable()
                                        .padding()
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Consultar estoque")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                }
                                
                            }//Elementos card
                            
                        }//Card 2
                    }
                    
                    NavigationLink(destination: RetirarRemedios()){
                        //Card 3
                        ZStack{
                            
                            //Fundo
                            RoundedRectangle(cornerRadius: 20)
                                .padding(.top)
                                .ignoresSafeArea()
                                .frame(width: 350, height: 150)
                                .foregroundColor(.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                            
                            //Elementos do card
                            VStack{
                                
                                HStack{
                                    Image(systemName: "pills.fill")
                                        .resizable()
                                        .padding()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.red)
                                    
                                    Text("Retirar remédios")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                }
                                
                            }//Elementos card
                            
                        }//card 3
                    }
                    Spacer()
                    
                    
                    
                    
                }
                
                
                
                
            }//zstack
            .onAppear(){
                viewModel.fetch()
            }
        }//navigation
    }//view
}

#Preview {
    ContentView()
}
