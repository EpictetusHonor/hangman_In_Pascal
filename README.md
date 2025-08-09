
<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">


>✅  Actually working perfectly! <br>
>❗  Single-player mode added! <br>


                
<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">


# Hangman Game in Pascal

## 🎯 Project Description

This project is a complete implementation of the classic **Hangman** game written in **Pascal**, developed as an exercise in structured programming and algorithmic logic. It was designed as a foundational piece for a growing collection of games, progressively increasing in complexity as university knowledge expands.

---

## 📌 Key Features

- **Classic mode**: Player 1 inputs a secret word, and Player 2 must guess it.
- Console interface with ASCII-style paper graphics.
- Incorrect guesses progressively draw a hangman figure.
- Input validation with error messages and embedded humor.
- Risk module: the player may take a chance and guess the full word.
- Victory/defeat messages and personalized game stats.
- Modular design with reusable procedures.

---

## 🧠 Knowledge and Skills Applied

### 1. **Structured Programming**
- Modular use of `procedures` to separate responsibilities and increase readability.
- Use of custom `type` declarations to improve semantic clarity (e.g., `letters`, `picture`, `range2`).

### 2. **Algorithmic Logic**
- Control structures (`repeat`, `while`, `if-then-else`) used to handle input and game flow.
- Error handling and input validation to ensure proper player interaction.

### 3. **Data Structure Design**
- Custom arrays to manage letters and graphics (`array[range] of char`, `picture`).
- Use of `record` types to visually represent the hangman in a structured format.

### 4. **Console Interaction Design**
- Guided conversation style with humorous and motivational messages.
- Menu and confirmation system before the game starts or reveals the word.
- Charging simulation with visual delay (`chargingModule`) for immersion.

### 5. **Robust Error Management**
- Proper handling of invalid characters or repeated inputs.
- Feedback loops that handle mistakes in a player-friendly (and funny) way.

---

## ⚙️ Future Improvements (Backlog)

The following features are considered conceptual at this stage.  
They may be implemented in the future **only if the project proves valuable or meaningful to me**.  
As of now, this is a personal and educational project developed for learning purposes.

1. **Single-player mode** with randomly chosen words.  ✅ (ADDED)
2. **Extra details**: Show all the letters you have already used.
3. **Internationalization (i18n)**: multilingual support (English/Spanish).
4. **Competitive mode** (1v1 with crossed words).
6. **Persistence**: score and player statistics storage.
7.  **More Graphic**: Make it more graphic and less console-like by adapting it to another language.
8. **Experimental Online Multiplayer**: foundation for educational client-server development.
---

## 🧪 How to Compile and Run

1. Open the file using **Free Pascal** or **Turbo Pascal**.
2. Compile the code (`F9` in Free Pascal).
3. Run the program from the console and follow the instructions.

  **Or always you can use the hangman .exe with "nounlist.txt" for single-player mode allowed in hangman_In_Pascal/dist/**

---

## 🧑‍🎓 Author

**Tomás Agustín Rossi**  
Temporary alias: *EpictetusHonor*  
Project developed as part of university learning, aiming to integrate programming knowledge in a fun and educational way.

---

## 📜 License

This project is released under the MIT License for academic, personal, or educational use.
