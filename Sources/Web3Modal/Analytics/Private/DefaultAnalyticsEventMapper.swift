class DefaultAnalyticsEventMapper: AnalyticsEventMapper {
    func eventName(for event: AnalyticsEvent) -> String {
        switch event {
        case .MODAL_LOADED:
            return "MODAL_LOADED"
        case .MODAL_OPEN:
            return "MODAL_OPEN"
        case .MODAL_CLOSE:
            return "MODAL_CLOSE"
        case .CLICK_ALL_WALLETS:
            return "CLICK_ALL_WALLETS"
        case .SELECT_WALLET:
            return "SELECT_WALLET"
        case .CLICK_NETWORKS:
            return "CLICK_NETWORKS"
        case .OPEN_ACTIVITY_VIEW:
            return "OPEN_ACTIVITY_VIEW"
        case .SWITCH_NETWORK:
            return "SWITCH_NETWORK"
        case .CONNECT_SUCCESS:
            return "CONNECT_SUCCESS"
        case .CONNECT_ERROR:
            return "CONNECT_ERROR"
        case .DISCONNECT_SUCCESS:
            return "DISCONNECT_SUCCESS"
        case .DISCONNECT_ERROR:
            return "DISCONNECT_ERROR"
        }
    }

    func parameters(for event: AnalyticsEvent) -> [String: String] {
        switch event {
        case .MODAL_LOADED:
            return [:]
        case let .MODAL_OPEN(connected):
            return ["connected": connected.description]
        case let .MODAL_CLOSE(connected):
            return ["connected": connected.description]
        case .CLICK_ALL_WALLETS:
            return [:]
        case let .SELECT_WALLET(wallet):
            let walletName = wallet.name
            return ["wallet": walletName]
        case .CLICK_NETWORKS:
            return [:]
        case .OPEN_ACTIVITY_VIEW:
            return [:]
        case let .SWITCH_NETWORK(network):
            let networkName = network.chainName
            return ["network": networkName]
        case let .CONNECT_SUCCESS(method):
            return ["method": method.rawValue]
        case let .CONNECT_ERROR(errorType):
            let error: String
            switch errorType {
            case .timeout:
                error = "timeout"
            case .rejected:
                error = "rejected"
            case let .arbitrary(message):
                error = message
            }
            
            return ["message": error]
        case .DISCONNECT_SUCCESS:
            return [:]
        case .DISCONNECT_ERROR:
            return [:]
        }
    }
}
