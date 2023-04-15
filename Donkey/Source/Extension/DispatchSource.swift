//
//  DispatchSource.swift
//
//  Created by Rex Lee on 2021/8/24.
//

public extension DispatchSource {
    class func dispatchTimer(timeInterval: Double, handler: @escaping (DispatchSourceTimer?) -> Void, needRepeat: Bool)-> DispatchSourceTimer{
        
        let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timer.schedule(deadline: .now(), repeating: timeInterval)
        timer.setEventHandler {
            DispatchQueue.main.async {
                if needRepeat {
                    handler(timer)
                } else {
                    timer.cancel()
                    handler(nil)
                }
            }
        }
        timer.resume()
        return timer
    }
}
