# Swiftui-Login-and-Onboarding-Template
This swiftUI Demo shows a simple template for an ios loading screen. The demo includes an
On-boarding screens, login screen, forgot password screen and sign up screen. Currently, this demo
does not have any back end framework. To login in the test email and password is hard coded to "test@gmail.com" and "1234".

# Description #
In the views folder, the main view controller is labeled as "MainAppView.swift" (This is different from the file labeled 
"Main View" which controls the home page of the app. Currently this page just displays the text "Main" as seen at
the end of the demo.) The MainAppView uses a series of state variables and if statments to transition between views. The state 
variables are passed into their respective views and set to true or false through the buttons in the view. 

The first view that is presented in the login page. This page has a field to input the user email and password. Likewise,
there are two sheets that are presented when the user presses the forgot password button or the sign up button. These sheets contain 
more fields for the user to fill out. 

Once the test email and password are entered the "MainAppView.swift" transition into the onboarding view. This view contains a set of three
images and text that are set as place holders. The main aspect is that as the user presses the different buttons the pictures display a
sliding animation from one to the next. Lastly, as the user presses the third button a continue button apprears and the user is directed to
the home page of the app. 

# Table of Contents #
- Login UI - It will validate login credentials, after successfully login it will display the Onboarding view
- OnBoarding UI - Created onboarding UI, using view controllers & page control
- Forgot Password UI - presented forgot password UI
- Sign UP UI

# Conclusion #
Though basic, this can be used as a foundation for disigning a login page and onboarding page. Simply change the background images, colors,
and texts to something that works with your app design and the everything else should work the same. 
