import SwiftUI

struct ContentView: View {
    @State private var brightnessAmount: Double = 0
    @State private var selectDate = Date()
    @State private var selectBlend = BlendMode.screen
    @State private var isBlend = false
    @State private var showSecondPage = false
    
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)}
    let blendModes: [BlendMode] = [.screen, .colorDodge, .colorBurn]
    
    var body: some View {
        VStack {
        GeometryReader { geometry in
            Image("you\(self.year)")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.size.width / 4 * 3)
                .clipped()
                .brightness(self.brightnessAmount)
            Image("pokeball2")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.size.width / 4 * 3)
                .clipped()
                .blendMode(self.selectBlend)
            }
            
            Form {
            HStack {
            Text("亮度")
            Slider(value: self.$brightnessAmount, in: 0...1,
            minimumValueLabel: Image(systemName:
            "sun.max.fill").imageScale(.small), maximumValueLabel:
            Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")}}
                
            DatePicker("時間", selection: self.$selectDate,
                displayedComponents: .date)
                
                Toggle("選擇 blend", isOn: $isBlend)
                if isBlend {
            Picker("選擇 blend", selection: self.$selectBlend) {
            ForEach(self.blendModes, id: \.self) { (blendMode) in Text(blendMode.name)}
            }.pickerStyle(SegmentedPickerStyle())
                }
                Button("好感度模擬器") {
                self.showSecondPage = true
                }
                .sheet(isPresented: self.$showSecondPage) {
                leftView()
                }
                
            }
        }
    }
}
extension BlendMode {
 var name: String {
 return "\(self)"
 }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
