import Foundation

// Screens defined here
enum Route: Equatable {
    case launch
    case signIn
    case signUp
    case success
    case home
    case reservations
    case profile
    case allRestaurants
    case seeAllRestaurants(title: String, restaurants: [Restaurant])
    case restaurantDetails
    case accountsettings
    case usernamesettings
    case feedbackscreen
    case aboutus
    case reserve
    case seeAllCuisines
    case reservesuccess
}
