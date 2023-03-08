//
//  ViewController.swift
//  WeLearn
//
//  Created by Andrei Cinca on 08/03/2023.
//
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

        // Disable the record button until authorization is granted
        recordButton.isEnabled = false

        // Request authorization to use speech recognition
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    self.recordButton.isEnabled = true
                }
            }
        }
    }

    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop()
            request.endAudio()
            recordButton.isEnabled = false
            recordButton.setTitle("Record", for: .normal)
        } else {
            startRecording()
            recordButton.setTitle("Stop", for: .normal)
        }
    }

    func startRecording() {
        // Configure the audio session for recording
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Error configuring audio session: \\\\(error.localizedDescription)")
        }

        // Configure the audio engine for recording
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

        // Start the audio engine and recording
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { (buffer, time) in
            self.request.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Error starting audio engine: \\\\(error.localizedDescription)")
        }
    }

}
