import SwiftUI

struct ContentView: View {
    @State private var hungerLevel = 5
    @State private var happinessLevel = 8
    @State private var energyLevel = 7
    
    func feed() {
        hungerLevel = min(hungerLevel + 1, 10)
    }
    func play() {
        happinessLevel = min(happinessLevel + 1, 10)
    }
    func nap() {
        energyLevel = min(energyLevel + 1, 10)
    }
    struct ActionButton: View  {
        let label: String
        let emoji: String
        let color: Color
        
        var body: some View {
            HStack {
                Text(emoji)
                Text(label)
            }
            .padding()
            .background(color.opacity(0.2))
            .cornerRadius(8)
            
        }
    }
    
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack { 
            
            
            
            
            Image ("8-bit house")
                .resizable()
                .ignoresSafeArea()
            Image ("pixilart-drawing")
                .resizable()
                .frame(width: 200, height: 200)
            
            Spacer()
            VStack {
                Text ("Hunger: \(hungerLevel)/10")
                    .font(.headline)
                    .foregroundColor(.red)
                Text ("Happiness: \(happinessLevel)/10")
                    .font(.headline)
                .foregroundColor(.blue)
                Text ("Energy: \(energyLevel)/10")
                    .font(.headline)
                .foregroundColor(.green)
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 40)
            .padding(.leading, 575)
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: feed) {
                        ActionButton(label: "Feed", emoji: "🍎", color: .red)
                        
                    }
                    
                    Button(action: play) {
                        ActionButton(label: "Play", emoji: "🎾", color: .blue)
                        
                    }
                    
                    Button(action: nap) {
                        ActionButton(label: "Nap", emoji: "😴", color: .green)
                        
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding(.bottom, 30) // Space from bottom
            }
            
            
        } .onReceive(timer) { _ in
            let randomStat = Int.random(in: 0...2)
            
            switch randomStat {
            case 0: hungerLevel = max(hungerLevel - 1, 0)
            case 1: happinessLevel = max(happinessLevel - 1, 0)
            default: energyLevel = max(energyLevel - 1, 0)
            }
            
        }
    }  