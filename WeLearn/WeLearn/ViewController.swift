//
//  ViewController.swift
//  WeLearn
//
//  Created by Andrei Cinca
//
// This controller takes care of the transcription functionality and printing out the speech-to-text
import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var recordButton: UIButton!

    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wb1.pdf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // wait for authorization to be granted
        recordButton.isEnabled = false

        // Request authorization for use of speech libraries and caption input
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.recordButton.isEnabled = true
                }
            }
        }
    }
    
    // the interaction when the button for recording is tapped
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop()
            request.endAudio()
            recordButton.isEnabled = false
            recordButton.setTitle("", for: .normal)
        } else {
            startRecording()
            recordButton.setTitle("Stop", for: .normal)
        }
    }

    func startRecording() {
        // Configure session for recording audio
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Error configuring audio session")
        }

        // Configure the  engine
        let inputNode = audioEngine.inputNode
        request.shouldReportPartialResults = true
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
            if let result = result {
                self.textView.text = result.bestTranscription.formattedString
            }
            if error != nil || result?.isFinal == true {
                self.audioEngine.stop()
                self.recognitionTask = nil
                self.request.endAudio()
                self.recordButton.isEnabled = true
            }
        })

        // Begin the recording
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { (buffer, time) in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine")
        }
    }

}
