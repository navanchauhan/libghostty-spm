import Foundation

@inline(__always)
func terminalRunOnMain(
    _ operation: @escaping @MainActor () -> Void
) {
    Task { @MainActor in
        if !Task.isCancelled {
            operation()
        }
    }
}
