

import SwiftUI


struct ContentView: View {
    
    @State var showComposeMessageView: Bool = false
    
    var body: some View {
        
        TabView {
            
            // MARK: - First Tab
            NavigationView {
                
                List(0..<4) {
                    iteration in
                    
                    NavigationLink(destination: Text("Message Text \(iteration)")) {
                        SingleMessageView()
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Inbox")
                .navigationBarItems(trailing:
                                        
                                        Button(action: {
                                            showComposeMessageView.toggle()
                                        }, label: {
                                            Image(systemName: "square.and.pencil")
                                        })
                                        
                )
                
            }
            .sheet(isPresented: $showComposeMessageView, content: {
                ZStack {
                    Color.blue
                    Text("🙂").font(Font.title)
                }
                .edgesIgnoringSafeArea(.all)
            })
            .tabItem {
                Image(systemName: "envelope.fill")
                Text("Inbox")
            }
            
            
            // MARK: - Second Tab
            Text("Sent Messages")
                .tabItem {
                    Label("Sent", systemImage: "paperplane.fill")
                }
            
            
        }
        
        
    }
    
}



struct SingleMessageView: View {
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 42.0, height: 42.0)
                .foregroundColor(.gray)
                .padding(4.0)
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Text("Martin") // Sender
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("1987-06-04") // Date
                        .font(Font.subheadline.monospacedDigit())
                        .foregroundColor(.secondary)
                    
                }
                
                Text("Hello world") // Subject
                    .font(.subheadline)
                    .lineLimit(1)
                
            }
            
        }
        
    }
    
}



// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


