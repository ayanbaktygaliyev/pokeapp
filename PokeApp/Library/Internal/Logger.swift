protocol Logger {
    func log(_ value: String)
}

struct EmptyLog: Logger {
    func log(_ value: String) {}
}

struct DebugLog: Logger {
    func log(_ value: String) {
        print(value)
    }
}
