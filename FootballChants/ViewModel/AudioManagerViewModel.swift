//
//  Untitled.swift
//  FootballChants
//
//  Created by ByteDance on 25/5/25.
//

import Foundation
import AVKit

class AudioManagerViewModel {

    private var chantAudioPlayer: AVAudioPlayer?

    func playback(_ team: Team) {
        if team.isPlaying {
            chantAudioPlayer?.stop()
        } else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            let url = URL(fileURLWithPath: path)
            do {
                chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                // continously loop forever
                chantAudioPlayer?.numberOfLoops = -1
                chantAudioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }
}
