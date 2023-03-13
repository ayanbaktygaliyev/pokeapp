import Foundation

struct SessionLogger {
    enum Style {
        case verbose, all, none
    }

    private var logStyle: Style {
        #if DEBUG
        return .all
        #else
        return .none
        #endif
    }

    private var divider: String {
        "------------------------------------------"
    }

    let queue = DispatchQueue(label: "com.pokeapp.http.logger")

    func request<Value>(_ request: URLRequest, didParseResponse response: Result<Value, Error>) {
        guard self.logStyle == .all else {
            return
        }
        
        self.logRequest(request)
//        self.logResponse()
//        self.logError()
    }

    // MARK: - Private methods

    private func logError(_ error: Error) {
        print(self.divider)

        print("Error: \(error.localizedDescription)")

        if let reason = (error as NSError).localizedFailureReason {
            print("Reason: \(reason)")
        }

        if let suggestion = (error as NSError).localizedRecoverySuggestion {
            print("Suggestion: \(suggestion)")
        }
    }

    private func logResponse(_ response: URLResponse, data: Data?, request: URLRequest?) {
        print(self.divider)

        if let url = response.url?.absoluteString {
            print("Response URL: \(url)")
        }

        if let httpResponse = response as? HTTPURLResponse {
            let localisedStatus = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode).capitalized
            print("Status: \(httpResponse.statusCode) - \(localisedStatus)")
        }

        if let method = request?.httpMethod {
            print("Response methods: \(method)")
        }

        if let headers = (response as? HTTPURLResponse)?.allHeaderFields as? [String: Any] {
            self.logHeaders(headers)
        }

        guard let data = data else {
            return
        }

        if data.count > 4 * 1024 {
            return
        }

        print("Response body: \(self.convertDataToPrettyString(data))")
    }

    private func logHeaders(_ headers: [String: Any]) {
        let headersString = "Headers: [\n" + headers.reduce("") { $0 + "  \($1.key) : \($1.value), \n" } + "\n]"
        print(headersString)
    }

    private func convertDataToPrettyString(_ data: Data) -> String {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let pretty = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

            if let string = NSString(data: pretty, encoding: String.Encoding.utf8.rawValue) {
                return "JSON: \(string)"
            }
        } catch {
            if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                return "Data: \(string)"
            }
        }

        return ""
    }

    private func logRequest(_ request: URLRequest) {
        print(self.divider)

        if let url = request.url?.absoluteString, let method = request.httpMethod {
            print("Request: \(method) \(url)")
        }

        if let headers = request.allHTTPHeaderFields {
            self.logHeaders(headers)
        }
        if let bodyData = request.httpBody {
            print("Request body: \(self.convertDataToPrettyString(bodyData))")
        }
    }
}
