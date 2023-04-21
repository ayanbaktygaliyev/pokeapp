import Foundation

public enum Dates {
    public enum DateFormat: Int {
        case iso8601
        
        public var formatString: String {
            switch self {
            case .iso8601:
                return  "yyyy-MM-dd'T'HH:mm:ss.SSSS"
            }
        }
    }

    public static func parseDate(string: String?, format: DateFormat) -> Date? {
        guard let string else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = format.formatString
        
        return formatter.date(from: string)
    }
    
    public static func parseString(date: Date, format: DateFormat = .iso8601) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = format.formatString
        return dateFormatter.string(from: date)
    }
    
    public static func hoursAndMinutes(string: String?, format: DateFormat = .iso8601) -> String {
        let calendar = Calendar.current
        guard let date = Self.parseDate(string: string, format: format) else {
            return ""
        }
        
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return "\(hours):\(minutes == 0 ? "00" : "0")"
    }
}
