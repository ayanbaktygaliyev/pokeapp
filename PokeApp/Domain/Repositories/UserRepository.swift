import Foundation
import Combine
import SwiftUI
import CoreLocation

final class UserRepository: NSObject, CLLocationManagerDelegate {
    var username: String {
        get {
            UserDefaults.standard.string(forKey: "username") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "username")
        }
    }
    
    var latitude: Double = 0
    var longitude: Double = 0
    
    private let session: SessionCoordinator
    
    init(session: SessionCoordinator = .shared) {
        self.session = session
        super.init()
        getUserLocation()
    }
    
    func changeUsername(username: String) {
        self.username = username
    }
    
    func getUserReservations() -> ResultPublisher<[ReservationResponse]> {
        let parameter = RestaurantsRequest.LoginParameter(login: username)
        let parameters = DictionaryHelper.makeDictionary(from: parameter)
        let request = RestaurantsRequest.getReservations
        return session.post(request: request, parameters: parameters)
    }
    
    func getUserLocation() {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied, .notDetermined, .restricted:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#line, #file)
        print(String(describing: error))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationCoordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        latitude = locationCoordinates.latitude
        longitude = locationCoordinates.longitude
    }
}
