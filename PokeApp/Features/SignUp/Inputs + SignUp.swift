import Foundation

public struct SignUpInputs {
    public enum FailureReason: Hashable {
        case usernameNotInput
        case passwordNotInput
        case passwordIsLessThan7Characters
        case passwordDoesNotHaveNumbers
    }

    public enum Validated<Value>: Error {
        case valid(Value)
        case invalid(reasons: Set<FailureReason>)

        public var failureReasons: Set<FailureReason> {
            guard case .invalid(let reasons) = self else {
                return []
            }
            return reasons
        }

        public func value() throws -> Value {
            guard case .valid(let value) = self else {
                throw self
            }
            return value
        }
    }

    public var validated: Validated<(username: String, password: String)>?
    public var username = ""
    public var password = ""

    public init() {}

    public func validatedUsername() -> Validated<String> {
        guard !username.isEmpty else {
            return .invalid(reasons: [.usernameNotInput])
        }

        return .valid(username)
    }

    public func validatedPassword() -> Validated<String> {
        guard !password.isEmpty else {
            return .invalid(reasons: [.passwordNotInput])
        }
        
        guard password.count >= 7 else {
            return .invalid(reasons: [.passwordIsLessThan7Characters])
        }
        
        guard let _ = password.rangeOfCharacter(from: .decimalDigits) else {
            return .invalid(reasons: [.passwordDoesNotHaveNumbers])
        }

        return .valid(password)
    }

    public mutating func validate() {
        let username = validatedUsername()
        let password = validatedPassword()

        do {
            let inputs = try (username: username.value(), password: password.value())
            validated = .valid(inputs)
        }
        catch {
            let reasons = username.failureReasons
                .union(password.failureReasons)

            validated = .invalid(reasons: reasons)
        }
    }
}
