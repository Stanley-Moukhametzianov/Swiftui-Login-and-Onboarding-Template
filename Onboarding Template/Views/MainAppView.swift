

import SwiftUI


struct MainAppView: View {
    @State var onBoarding = true
    @State var logged = false
    
    var body: some View {
        if !logged{
            loginPage(logged: $logged)
        }
        else{
            if onBoarding{
                OnboardingView(onBoarding: $onBoarding)
            }
            else{
                MainView()
            }
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainAppView()
        
    }
}
