# Crazy Road (Processing)

**Crazy Road** is an arcade-style dodging game built in **Processing**.  
You drive a car down a busy road and try to avoid rocks, pylons, other cars, and even raccoons.  
Each obstacle you avoid earns you points, but collisions cost you lives. When you run out of lives, it’s game over.

Created as an ICS2O1 project.

---

## Game Concept

- You control a car at the **bottom** of the screen.
- Multiple obstacles fall from the top:
  - Rocks
  - Road pylons
  - Other cars
  - A raccoon
- Your car can move **left** and **right** across the lanes.
- Each time an obstacle safely passes off the bottom of the screen, you gain **+1 point**.
- If any obstacle **hits your car**, you **lose 1 life**.
- You start with **3 lives**.
- When `lives == 0`, the game switches to the **Game Over** screen.

---

## Screens / Stages

The game flow is controlled by an integer `stage` variable:

- `stage == 0` → **Main Menu**
- `stage == 1` → **Help / Instructions Screen**
- `stage == 2` → **Play Screen (Game Running)**
- `stage == 3` → **Game Over Screen**
- `stage == 4` → **Reset and Return to Main Menu**

### Stage 0 – Main Menu

- Background road image.
- Shows:
  - **Crazy Road Logo** (`crazyRoadLogo.png`)
  - **Help** button (`help.png`)
  - **Play** button (`play.png`)
- Mouse interactions:
  - Click **Help** → `stage = 1`
  - Click **Play** → `stage = 2`

### Stage 1 – Help / Instructions

- Shows:
  - Instructions graphic (`instructions.png`)
  - **Back** button (`back.png`)
- Mouse interaction:
  - Click **Back** → returns to `stage = 0`.

### Stage 2 – Play Screen

This is where the main game loop runs:

- **Scrolling background road** using `scrollingRoad.jpg`:
  - The image is drawn starting at `by` and moved down a bit each frame.
  - Once it scrolls past a certain point, `by` is reset to give a continuous loop.

- **HUD (top-right box)**:
  - A small black rectangle displays:
    - `Points: <points>`
    - `Lives: <lives>`

- **Player car**:
  - Starts at position `(x = 220, y = 495)`.
  - Drawn with `car.png`.
  - Movement:
    - Left and right only (no vertical movement).
    - Controlled by the **left/right arrow keys** (coded keys).
  - Restricted to the road area:
    - If `x <= 75`, it’s pushed back right.
    - If `x >= 365`, it’s pushed back left.

- **Obstacles**:
  There are **five** independent obstacles, each with its own position and speed.

  1. **Rock**
     - Image: `rock.png`
     - Position: `(cX1, cY1)`
     - Speed: `s1` (random between 4 and 7)
     - Spawn X-range: `80–325`

  2. **Pylon**
     - Image: `pylon.png`
     - Position: `(cX2, cY2)`
     - Speed: `s2`
     - Spawn X-range: `80–325`

  3. **Grey Car**
     - Image: `car1.png`
     - Position: `(cX3, cY3)`
     - Speed: `s3`
     - Spawn X-range: `250–325`

  4. **Blue Car**
     - Image: `car2.png`
     - Position: `(cX4, cY4)`
     - Speed: `s4`
     - Spawn X-range: `80–180`

  5. **Raccoon**
     - Image: `raccoon.png`
     - Position: `(cX5, cY5)`
     - Speed: `s5`
     - Spawn X-range: `340–380`

  - All `cY` values start above the screen (`-150` to `-20`) so they “fall into” view.
  - Each frame, `cY# = cY# + s#` to move obstacles downward.

- **Collision Detection**

  The game uses circular distance checks (`dist()`) to detect collisions:

  - Rock vs car:
    ```java
    if (dist(cX1, cY1, x - 10, y + 10) < r2 + 10)
    ```
  - Pylon vs car:
    ```java
    if (dist(cX2, cY2, x, y) < r2 + 10)
    ```
  - Grey car vs car:
    ```java
    if (dist(cX3, cY3, x, y - 40) < r + 10)
    ```
  - Blue car vs car:
    ```java
    if (dist(cX4, cY4, x, y - 50) < r + 10)
    ```
  - Raccoon vs car:
    ```java
    if (dist(cX5, cY5, x, y + 10) < r3 + 10)
    ```

  If there is a collision:
  - `lives` is decreased by 1.
  - The obstacle is respawned:
    - `cY#` reset to a random value above the screen.
    - `cX#` reset within the appropriate lane.
    - `s#` may be randomized again in some cases.

- **Scoring**

  When an obstacle goes off the bottom of the screen (`cY# > 600`):

  - `points++`
  - The obstacle is respawned above the screen with a new speed and sometimes a new X position.

- **Game Over Condition**

  - When `lives == 0`, the game moves to **stage 3**:
    ```java
    if (lives == 0) {
      stage = 3;
    }
    ```

### Stage 3 – Game Over

- Shows:
  - Background road image.
  - Crazy Road logo.
  - Game over artwork (`gameOver.png`).
  - **Main Menu** button (`mainMenu.png`).
- Mouse interaction:
  - Click **Main Menu** → sets `stage = 4` to reset the game.

### Stage 4 – Reset

Resets key state so you can replay:

- Player car position:
  - `x = 220;`
  - `y = 495;`
- Score & lives:
  - `points = 0;`
  - `lives = 3;`
- Obstacle vertical positions and speeds:
  - `cY1...cY5` randomized back above the screen.
  - `s1...s5` randomized between 4 and 7.
- Sets `stage = 0` to go back to the **main menu**.

---

## Controls

### Keyboard

- **Move Right:** `RIGHT ARROW`
- **Move Left:** `LEFT ARROW`

### Mouse

- On **Main Menu**:
  - Click **Help** → show instructions.
  - Click **Play** → start the game.

- On **Help Screen**:
  - Click **Back** → return to main menu.

- On **Game Over Screen**:
  - Click **Main Menu** → reset and return to the main menu.

---

## Assets

This sketch uses several images and a font file. Place all of these into your Processing sketch’s `data` folder:

- `car.png` – Player’s car.
- `car1.png` – Grey car obstacle.
- `car2.png` – Blue car obstacle.
- `rock.png` – Rock obstacle.
- `pylon.png` – Traffic pylon obstacle.
- `raccoon.png` – Raccoon obstacle.
- `scrollingRoad.jpg` – Tall road image for scrolling background.
- `road.png` – Static background for menu and game over screens.
- `crazyRoadLogo.png` – Game logo.
- `play.png` – Play button graphic.
- `help.png` – Help button graphic.
- `back.png` – Back button.
- `mainMenu.png` – Main menu button on game over screen.
- `gameOver.png` – Game over graphic.
- `instructions.png` – Instructions/how-to-play image.
- `font.vlw` – Font file generated by Processing (via **Tools → Create Font…**).

In Processing:

1. **Sketch → Add File…**
2. Select each image / font file.
3. Processing will automatically copy them into `data/`.

---

## How to Run

1. **Install Processing**

   Download from:  
   https://processing.org/

2. **Create a New Sketch**

   - Open Processing.
   - Create a new sketch, e.g. `CrazyRoad`.
   - Paste the full `CrazyRoad` code into the editor.

3. **Add Assets**

   - Add all `.png`, `.jpg`, and `.vlw` files via **Sketch → Add File…**.
   - Make sure the filenames exactly match the ones used in the code.

4. **Run the Sketch**

   - Click the **Run** button (triangle) in Processing.
   - Use the **arrow keys** to move your car left and right.
   - Avoid obstacles and rack up points!

---

## Possible Improvements

Some ideas if you want to evolve this project:

- Add **sound effects** for collisions, scoring, and background music.
- Add different **difficulty levels** (faster obstacles, more crowded lanes).
- Show a **“Best score” / High score** between runs.
- Add a **pause menu**.
- Include a small **countdown** or “Get Ready…” message when starting the game.
- Add **lane lines** or more visual feedback when you switch lanes.

---

## Credits

**Developer:**  
- Rohan Bhanot  

Built as a high school ICS2O1 project to practice animation, collision detection, user input, and game state management in Processing.
