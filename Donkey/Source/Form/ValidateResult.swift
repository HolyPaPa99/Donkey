//
//ValidateResult
//created by Rex 2021/10/08
//

public struct ValidateResult{
    public static var valid: ValidateResult = ValidateResult(.valid, errMsg: "")
    public enum Status{
        case valid
        case invalid
    }
    public var status: ValidateResult.Status
    
    public var errMsg: String
    
    private init(_ status: ValidateResult.Status, errMsg: String){
        self.status = status
        self.errMsg = errMsg
    }
    
    public static func invalid(_ errMsg: String)-> ValidateResult{
        return ValidateResult(.invalid, errMsg: errMsg)
    }
}
