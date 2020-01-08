//Bobs code.
 

import Foundation
import MapKit

class AdventureMapOverlay: MKTileOverlay {

  override func url(forTilePath path: MKTileOverlayPath) -> URL {

      // 1
      let tilePath = Bundle.main.url(
        forResource: "\(path.y)",
        withExtension: "png",
        subdirectory: "tiles/\(path.z)/\(path.x)",
        localization: nil)
   

      guard let tile = tilePath else {

        // 2
        return Bundle.main.url(
          forResource: "parchment",
          withExtension: "png",
          subdirectory: "tiles",localization: nil)!
      }
       print("requested tile\tz:\(path.z)\tx:\(path.x)\ty:\(path.y)")

      return tile
    }
    
}

