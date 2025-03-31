import SwiftUI

struct GameArena: View {
    
    // Define the grid size
    let rows = 11
    let columns = 15
    let blockSize: CGFloat = 30
    
    // Track player position (starting at top-left corner, just inside boundary)
    @State private var playerPosition = (x: 2, y: 1)
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<columns, id: \.self) { column in
                        
                        ZStack {
                            if (row % 2 == 1 && column % 2 == 1) || row == 0 || row == rows - 1 || column == 0 || column == columns - 1 {
                                // Unbreakable Block (Permanent Wall or Boundary Wall)
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: blockSize, height: blockSize)
                            } else {
                                // Empty Space
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: blockSize, height: blockSize)
                                
                                // Place the player at its current position
                                if playerPosition.x == column && playerPosition.y == row {
                                    Player()
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .gesture(DragGesture(minimumDistance: 0)
            .onEnded { gesture in
                handleMovement(gesture: gesture)
            })
    }
    
    private func handleMovement(gesture: DragGesture.Value) {
        let translation = gesture.translation
        
        // Movement threshold to prevent accidental taps
        let threshold: CGFloat = 15.0
        
        var newPosition = playerPosition
        
        if translation.width > threshold && canMove(to: (playerPosition.x + 1, playerPosition.y)) {
            newPosition.x += 1 // Move Right
        } else if translation.width < -threshold && canMove(to: (playerPosition.x - 1, playerPosition.y)) {
            newPosition.x -= 1 // Move Left
        } else if translation.height > threshold && canMove(to: (playerPosition.x, playerPosition.y + 1)) {
            newPosition.y += 1 // Move Down
        } else if translation.height < -threshold && canMove(to: (playerPosition.x, playerPosition.y - 1)) {
            newPosition.y -= 1 // Move Up
        }
        
        playerPosition = newPosition
    }
    
    private func canMove(to position: (x: Int, y: Int)) -> Bool {
        // Ensure the player doesn't move into unbreakable blocks or outside the grid
        if position.y >= 0 && position.y < rows && position.x >= 0 && position.x < columns {
            if (position.y % 2 == 1 && position.x % 2 == 1) ||
                position.y == 0 || position.y == rows - 1 ||
                position.x == 0 || position.x == columns - 1 {
                return false
            }
            return true
        }
        return false
    }
}

#Preview {
    GameArena()
}
