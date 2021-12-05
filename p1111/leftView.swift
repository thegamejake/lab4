import SwiftUI

struct leftView: View {
    @State private var suki = 0.0
    @State private var text = ""
    @State private var name = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.suki += 1
                if self.suki >= 20
                {self.showAlert = true}
                self.text = "你的寶可夢逃跑了"
            }) {
        Image("furi01")
            .resizable()
            .scaledToFill()
            .frame(width: 200,
                   height: 200)
            .clipShape(Circle())
            }.buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showAlert)
            {
                 () -> Alert in
                      return Alert(title: Text("你的寶可夢逃跑了"))
            }
            
        Stepper(value: $suki, in: 0...100, step: 0.01) {
            Text("  好感度  \(suki, specifier: "%.2f")")
        }
            TextField("你的名字", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2))
            .padding()

        }
    }
    }


struct leftView_Previews: PreviewProvider {
    static var previews: some View {
        leftView()
    }
}
