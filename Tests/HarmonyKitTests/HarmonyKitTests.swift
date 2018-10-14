import UIKit
import XCTest
@testable
import HarmonyKit

final class HarmonyKitTests: XCTestCase {
    lazy var expectedHarmonies: [Harmony] = {
        return [
            Harmony(tone: .C, octave: 1, frequency: 32.851845),
            Harmony(tone: .Db, octave: 1, frequency: 34.80532),
            Harmony(tone: .D, octave: 1, frequency: 36.87495),
            Harmony(tone: .Eb, octave: 1, frequency: 39.06765),
            Harmony(tone: .E, octave: 1, frequency: 41.390736),
            Harmony(tone: .F, octave: 1, frequency: 43.851955),
            Harmony(tone: .Gb, octave: 1, frequency: 46.459526),
            Harmony(tone: .G, octave: 1, frequency: 49.222153),
            Harmony(tone: .Ab, octave: 1, frequency: 52.149055),
            Harmony(tone: .A, octave: 1, frequency: 55.25),
            Harmony(tone: .Bb, octave: 1, frequency: 58.53534),
            Harmony(tone: .B, octave: 1, frequency: 62.016026)
        ]
    }()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOneOctave() {
        let setting = HarmonyKit.Setting(
            pitch: 442,
            scaleType: .equal,
            rootTone: .C,
            transpositionTone: .C,
            octaveRange: 1..<2
        )
        let harmonies = HarmonyKit.tune(setting: setting)
        let sortedHarmonies = harmonies.sorted()
        sortedHarmonies.forEach { print($0) }

        XCTAssertEqual(harmonies.count, 12, "num of sounds in 1 octave should be 12.")

        harmonies.forEach { harmony in
            guard expectedHarmonies.contains(harmony) else {
                XCTFail("Expected harmony could not be found: \(harmony)."); return
            }
        }
    }
}
