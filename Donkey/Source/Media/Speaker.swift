import AVFoundation

public class Speaker {
    private var synthesizer:AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    public init(){}
    
    public func speak(_ text:String, _ language:String)->Void {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: text)
        
        // Configure the utterance.
        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 1
        
        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice(language: language)
        
        // Assign the voice to the utterance.
        utterance.voice = voice
        synthesizer.usesApplicationAudioSession = false
        
        synthesizer.speak(utterance)
    }
    public func speak(_ utterance: AVSpeechUtterance){
        synthesizer.speak(utterance)
    }
    public func stopSpeak(){
        self.synthesizer.stopSpeaking(at: .immediate)
    }
    public func pauseSpeak(){
        self.synthesizer.pauseSpeaking(at: .immediate)
    }
    public func continueSpeak(){
        self.synthesizer.continueSpeaking()
    }
}
