program hangman;
uses
  SysUtils;  
const MAX_LIFES = 6;MAX_PALABRAS = 1000;  // Número total de palabras en el diccionario
type
    range = 1..46;  // range of letters, 46 is the maximum letters that i think is needed
    range2 = 0..MAX_LIFES;
    drawing = record    // picture of a hangman like the papers stile. it's change if you add losted lifes.
        draw3: string;
        draw2: string;
        draw1: string;
        draw0: string;  // array of word, 44 words is most that i think is needed.
    end;
    letters = array[range] of char;   
    picture = array[range2] of drawing; // array of strings to make some graphics designs!

//just a few dialogs lines
procedure welcome;
begin
    writeln('-----------------------------WELCOME TO HANGMAN!!!!-----------------------------');
    writeln;
    writeln('NEXT THE INSTRUCTIONS CHOOSE ONE OPTION: (just press one of those numbers and press Enter)');
    writeln('1- Classic Hangman Game (You and your friend can play)');
    writeln('2- Solo Mode (Random words just to pass the time)');
    // writeln('3- Competitive (1v1 with 2 words)');
    // writeln('3- One Player Mode (Random words just to pass the time)');
end;
procedure writeyourword;
begin
    writeLn('---------------------------------------------------');
    writeLn( 'WRITE your WORD and PRESS ENTER (all in lowercase)' );
    writeLn('---------------------------------------------------');
end;

function randomword: string; // IA HELP IN THIS FUNCTION!
const
  MAX_WORDS = 1000;
var
  Diccionary: array[1..MAX_WORDS] of string;
  f: TextFile;
  WORDS: string;
  totalWORDS, indice: Integer;
begin
  Randomize; // Initialize random seed

  // Try to open the file
  Assign(f, 'nounlist.txt');
  {$I-} // Disable IO checking
  Reset(f);
  {$I+}

  // If file not found or can't be opened
  if IOResult <> 0 then
  begin
    writeln('ERROR: The file "nounlist.txt" was not found in the same folder as Hangman.exe.');
    writeln('Please make sure it is downloaded and placed in the correct directory, or go to https://github.com/EpictetusHonor/hangman_In_Pascal and download it.');
    writeln('Single Player mode cannot start without this file.');
    writeln;
    writeln('---------------------------------------------------------------------------------------------------------------------------------------------------------');
    writeln('Another option: create your own "nounlist.txt" in the same directory of "hangman.exe" and insert all the words you want to see in the Single-player mode.');
    writeln('---------------------------------------------------------------------------------------------------------------------------------------------------------');
    randomword := '';
    Exit;
  end;

  totalWORDS := 0;
  while (not Eof(f)) and (totalWORDS < MAX_WORDS) do
  begin
    ReadLn(f, WORDS);
    Inc(totalWORDS);
    Diccionary[totalWORDS] := WORDS;
  end;
  Close(f);

  if totalWORDS = 0 then
  begin
    writeln('ERROR: The file "nounlist.txt" is empty.');
    writeln('Please ensure it contains at least one word.');
    randomword := '';
    Exit;
  end;

  indice := Random(totalWORDS) + 1;
  randomword := Diccionary[indice];
end;

procedure letstartthegame;
begin
    writeln;writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeln;writeln;
    writeLn('---------------------------------');
    writeLn( 'LET''S START THE GAME!' );
    writeLn('---------------------------------');
end;
procedure winner;
begin
    writeln;
    writeLn('-----------------------------------------------------------');
    writeln('GOOD WORK WINNER! YOU WIN! YOU CAN TO SURVIVE ONE MORE DAY.');
    writeLn('-----------------------------------------------------------');
    writeln;
end;
procedure makeMistake;
begin
    writeLn('Ok.. so, you are ok? You need to put only 1 letter "y" or "n" and press enter...');
    writeLn;
end;
procedure makeMistake2;
begin
    writeLn('For people like you, some shampoos come with manual. You need to put only 1 letter "y" or "n" and press enter... idiot...');
end;
procedure cantGoOut;
begin
    writeln('At this point you can go out!');
    writeln;
end;
procedure uniqueandriskyopportunity;
begin
    writeln;
    writeLn('---------------------------------');
    writeLn( ' UNIQUE AND RISKY OPPORTUNITY' );
    writeLn('---------------------------------');
end;
procedure saythewordandwin;
begin
    writeLn('-----------------------------------------');
    writeln('IF YOU SAY THE COMPLETE WORD YOU CAN WIN');
    writeLn('-----------------------------------------');
    writeLn;
end;


procedure chargingDelay (ms:integer);
var
    i,j:integer;
begin
    for i:=1 to ms do         // just a delay
        for j:=1 to 1000 do
        ;
end;
procedure chargingModule; // only in here i receive  some help with chatgpt, credits for him... great idea.
var
    i,j:integer;
begin
    writeln;
    writeln;
    writeln('                 Charging');
    for i:=1 to 2 do begin
        for j:=1 to 3 do begin
           chargingDelay(10);
           write(' ');
           end;
        writeln;
    end;
    write('                [');
    for i:=1 to 8 do begin
        chargingDelay(10000);
        write('-');
        end;
    writeln(']');
    writeln;
    writeln;
end;

procedure loadArray ( var lD:integer; var arr:letters ; wordd:string);      // load array of char with '_'
var
    i: integer;
begin
    lD:=length(wordd);
    for i:=1 to lD do
        arr[i]:='_';
end;

procedure picCreator (var pic:picture); //The creation of pictures for the game!
begin
    pic[0].draw3:=' ___';
    pic[0].draw2:=' |';
    pic[0].draw1:=' |';
    pic[0].draw0:=' |';
    pic[1].draw3:=' ___';
    pic[1].draw2:=' | o';
    pic[1].draw1:=' |';
    pic[1].draw0:=' |';
    pic[2].draw3:=' ___';
    pic[2].draw2:=' | o';
    pic[2].draw1:=' | |';
    pic[2].draw0:=' |';
    pic[3].draw3:=' ___';
    pic[3].draw2:=' | o';
    pic[3].draw1:=' |/|';
    pic[3].draw0:=' |';
    pic[4].draw3:=' ___';
    pic[4].draw2:=' | o';
    pic[4].draw1:=' |/|\';
    pic[4].draw0:=' |';
    pic[5].draw3:=' ___';
    pic[5].draw2:=' | o';
    pic[5].draw1:=' |/|\';
    pic[5].draw0:=' |/';
    pic[6].draw3:=' ___';
    pic[6].draw2:=' |(.';
    pic[6].draw1:=' |/|\              ||YOU LOSE!||';
    pic[6].draw0:=' |/ \';
end;
procedure picModule (pic:picture;lostLf:integer);
begin
    writeln(pic[lostLf].draw3);
    writeln(pic[lostLf].draw2);
    writeln(pic[lostLf].draw1);
    writeln(pic[lostLf].draw0);
    writeln('___    ');
end;

procedure ClassicFirstModule ( var wrd:string; var show:boolean );    // The firsts questions to start a game.
var
    aux:char; // confirmation auxiliar variable
    aux2:char; // confirmation auxiliar variable
begin
   repeat
        writeyourword;
        write('--> ');readln( wrd );
        writeLn( 'Confirm? y/n' );
        readLn(aux);
        while (not(aux = 'y') and not(aux = 'n') and not(aux = 'Y') and not(aux = 'N')) do begin
            writeln('You write another stuff, maybe some ice cream in your keyboard...');
            writeln;
            writeLn( 'Confirm? y/n' );
            readLn(aux);
            end;
        until((aux = 'y') or (aux = 'Y'));
        
   repeat
        writeLn( 'In the end of the game you want to show your CHOOSED WORD?' );
        readLn( aux2 );
        until((aux2 = 'y') or (aux2 = 'n') or (aux2 = 'Y') or (aux2 = 'N'));
    if ((aux2 = 'y') or (aux2 = 'Y')) then begin
        show:= true;
    end
    else
        show:= false;
end;
procedure takeTheRiskChallenge (wrd:string;a:char;var totL:integer;lD:integer;var tries:integer;var lL:range2); // This is the challenge, if you know the word you can win or lose 2 lifes
var
    a2:string;
begin
    writeln('WRITE the CORRECT WORD (if you lose, you"re going to lose 2 lifes)');
    readln(a2);
    tries:=tries+1;
    if (a2 = wrd) then begin
        totL:=lD;
    end
    else begin
        if (lL<4) then begin
            writeln;
            repeat
                writeln('Another opportunity? (In here you just loses some lifes but if you accept and lose, you lose the game!) y/n');
                readln(a);
                if ((a <> 'y') and (a <> 'n') and (a <> 'Y') and (a <> 'N')) then
                    writeln;
                    writeln('You can do it well, come on, i trust you are not idiot. Just push the letters y/n');
                    writeln;
                until((a = 'y') or (a = 'n') or (a = 'Y') or (a = 'N'));
            if ((a = 'y') or (a = 'Y')) then begin
                writeln('WRITE your ANSWER (only lowercase)');
                readln(a2);
                tries:=tries+1;
                if (a2 = wrd) then begin
                    totL:=lD;
                end
                else begin
                    lL:=lL+6;
                    end;
            end
            else begin
                writeln;
                writeln('Well... you lose 2 lifes for playing so bad the challenge! Wtf are you doing?');
                writeln;
                lL:=lL+2;
            end;
        end;
    end;
end;
procedure takeTheRisk(var wrd:string;var totL:integer;var lL:range2;lD:integer;var tries:integer);  // if the player know the word he can win or lose 2 lifes
var
    aux,aux2:char;
begin
    uniqueandriskyopportunity;
    repeat
        writeLn('    Take? y/n -->');readln(aux);
        writeLn;
        if (not(aux = 'y') and not(aux = 'n') and not(aux = 'Y') and not(aux = 'N')) then
            makeMistake;
        until((aux = 'y') or (aux = 'n') or (aux = 'Y') or (aux = 'N'));

    if ((aux = 'y') or (aux = 'Y')) then begin
        saythewordandwin;
        repeat
            writeLn('You are agree with that? y/n'); readln(aux2);
            if (not(aux2 = 'y') and not(aux2 = 'n') and not(aux2 = 'Y') and not(aux2 = 'N')) then begin 
                makeMistake2;
                end;
            until((aux2 = 'y') or (aux2 = 'n') or (aux2 = 'Y') or (aux2 = 'N'));
        if ( (aux2 = 'n') or (aux2 = 'N') ) then begin
            writeLn('You just lost 1 life for for discrediting your honor... muck');
            writeln;
            writeln;
            lL:=lL+1;
        end
        else begin
            writeln;
            cantGoOut;
            writeln;
            takeTheRiskChallenge(wrd,aux,totL,lD,tries,lL);
            end;
    end;
end;
procedure possibleChallenge (var totL:integer;var aux:boolean;var wrd:string;var lostLifes:range2;lD:integer;var tries:integer);    
begin
    if ((totL>2) and (aux=false)) then begin
        takeTheRisk(wrd,totL,lostLifes,lD,tries);                           // This give you the possibility to risk and say the correct word in one time of the game.
        aux:=true;
    end;
end;
//------------------------------------------------------------------------------------------------
procedure delete(var theword:string;position:integer);
begin
    theword[position]:='_';
end;
procedure addForTheWordDiscoverArray(var discoverArray:letters;i:integer;var newLetter:char);
begin
    discoverArray[i]:=newLetter;
end;
procedure searchAndInsert(var a:letters;var w:string;var totL:integer;insertedLetter:char;var lL:range2;var tries:integer;lD:integer);   // For any position of the array string compare if input letter is equal to the correct letter,
var                                             // same of the entrys but reduced                                       // next this insert the letter to the corrects positions in the array
    i:integer;
    notLetter:boolean;
begin
    notLetter:= true;
    tries:= tries+1;           //one tries left
    for i:=1 to lD do begin                                           
        if( w[i] = insertedLetter ) then begin // if the word letter is the same of new letter then...
            addForTheWordDiscoverArray(a,i,insertedLetter); //change the array with the letters modified 
            delete(w,i); // delete the letter of the word in all the places
            totL:= totL+1; //add one to added letters
            notLetter:= false; // false here if the letter is correct next
            end;
        end;

    if ( notLetter ) then begin  //if the letter wasn't correct, you lost one life
        lL:= lL+1;
    end;
end;
//--------------------------------------------------------------------------------------------------------------
procedure showSomeLetters(lD:integer;a:letters;totL:integer;final:boolean); // show the letters you have at the moment
var
    aux:integer;i:integer;
begin                     
    aux:=  lD-totL;
    writeln;
    for i:=1 to lD do
        write(a[i],' ');
    if (not(final)) then begin // if you lose this avoid inspiring you to continue... you don't have the honor, and letters!.
        if ((aux<=2)and(aux>0)) then begin
            writeln;
            writeln('---- You have ', aux, ' letters left! You can do it? ----');
            writeln;
        end
        else begin
            if (aux>0) then begin
                writeln;
                writeln('---- You have ', aux,' letters left! ----');
                writeln;
                end;
            end;
    end;
end;
procedure sameWord (var arr:letters;lD:integer;wordd:string);
var
    i:integer;
begin
    for i:=1 to lD do
        arr[i]:=wordd[i];  // select one 'char' per vector of the array of string
end;
procedure winner_Loser (WLlL:range2;WLshow:boolean;WLpic:picture;WLtries:integer;WLarr:letters;WLlD:integer;WLword:string; WLtotL:integer); // This is the winner or loser message and some statistics when you end the game
var
    final:boolean;
    aux2:char;
    email:string;
begin
    final:=true;
    if (WLlL>=MAX_LIFES) then begin
        writeln;
        writeLn('-----------------------------------------------------------------------------------------------');
        writeln('YOU LOSE THE ',WLlL,' LIFES IN ',WLtries,' TRIES');
        if WLshow then begin
            writeln('The correct answer was: ',WLword);
            sameWord(WLarr,WLlD,WLword);           // This inserts the WL letter by letter in array 
            showSomeLetters(WLlD,WLarr,WLtotL,final);        // To WL in display like hangman
        end
        else begin
            writeln('The HONORABLE WORD LETTER PICKER don"t want to SHOW the CORRECT ANSWER. UNRESPECT FOR HIM.');
            writeLn('------------------------------------------------------------------------------------------');    
        end;
    end
    else begin
        winner;
        writeln('You GUESSED the WORD in ', WLtries,' TRIES, losing ',WLlL,' LIFES.' );
        case WLlL of
            0: writeln('Ok man, so good! You did an excellent job -- your achievement was so huge it gave about ten grandmothers around the world a heart attack. Congratulations fos killing your grandma! Asshole.');
            1..3: writeln('Well play!');
            4..MAX_LIFES: writeln('Come on! You can do this better!');
            else
                writeln('Unknown value!');
        end;
        if ((WLtries = 0)or(WLtries = 1)) then begin
            writeln('WELL PLAYED MAN! JUST THE ONE POINT CERO PERCENT HAVE THIS ACHIEVEMENT... trust me, is JUST LIKE HACKING!');
            writeln;
            writeln('Changing the subject, totally unrelated question... do you think there"s a hacker nearby?');
            repeat
                read(aux2);
                if (not(aux2 = 'y') and not(aux2 = 'n') and not(aux2 = 'Y') and not(aux2 = 'N')) then begin 
                    makeMistake2;
                    end;
                until((aux2 = 'y') or (aux2 = 'n') or (aux2 = 'Y') or (aux2 = 'N'));
            writeln('ok, just insert your email... just for fun! haha... ha');
            read(email);
        end;
    end;
    writeln;
    writeln;
    writeln;
    writeln('-- GAME OVER --');        
end;

procedure mainAxis (lD:integer;arr:letters;wrd:string;show:boolean;pic:picture);  //This is the most important PROCESS, the life of the program the MAIN AXIS!
var                                                                   
    usrL:char;
    aux:boolean; // This put on when you are playing well the game
    totLet:integer; // total letters
    lostLifes:range2; // losted lifes
    tries:integer; // counter of tries
    final:boolean;
    showword:string;
begin
    showword:=wrd; // when you lose is the word you show to the public
    totLet:=0;  // total let
    tries:=0;  // counter
    aux:=false;  // for challenge
    lostLifes:=0; // losted lifes
    letstartthegame;
    writeLn('The word has ',lD,' letters, you have ',MAX_LIFES,' lifes.');
    final:=false;
    
    while (totLet<lD) and (lostLifes<MAX_LIFES) do begin                         // To stop when: 'total letters' are the same of 'word' and lostLifes has a 7
        writeLn('Insert some letter and press enter, COME ON!');
        readLn(usrL);

        searchAndInsert(arr,wrd,totLet,usrL,lostLifes,tries,lD);            // search and insert letters in array
        picModule(pic,lostLifes);
        showSomeLetters(lD,arr,totLet,final);
        possibleChallenge(totLet,aux,showword,lostLifes,lD,tries);
    end;    

    winner_Loser (lostLifes,show,pic,tries,arr,lD,showword,totLet); // show the winner or loser message and some statistics
end;
procedure instructions;
begin
    writeln;
    writeln;
    writeln('----------------------');
    writeln('Hangman - Instructions');
    writeln('----------------------');
    writeln;
    writeln;
    writeln('Hangman is a game designed for two players: one player provides a secret word, and the other players');
    writeln('objective is to guess that word in as few attempts as possible.');
    writeln;
    writeln('In this version of Hangman, you have 6 attempts to guess the word correctly. Additionally, there is one secret');
    writeln('chance available when you are close to completing the word.');
    writeln;
    writeln('Currently, only the classic mode is available. However, future updates may include a single-player mode, and');
    writeln('there are plans to develop an online multiplayer mode (Intended solely for educational purposes, should genuine');
    writeln('interest in the project arise. If implemented, the game will likely be hosted on a website.)');
    writeln('This game is a simple project, thoughtfully crafted with care by Tomas Agustin Rossi');
    writeln;
    writeln;
    writeln('If you wish to return, press Enter.');
    readln;
end;
procedure mainMenu;
var
    wordd: string;
    endd,instructionsYN: char;
    show: boolean;
    arrayy: letters;
    mode:integer;
    logic_dim: integer;
    pic: picture;
begin
    show:=true; //show the correct word in the end of the game, inicialized here to make this effective to all the modes!
    welcome;
    repeat
        writeln;
        writeln('-------------------------------------');
        writeln('Do you need to know the instructions? y/n');
        writeln('-------------------------------------');
        readln(instructionsYN);
        until ((instructionsYN = 'y') or (instructionsYN = 'Y') or (instructionsYN = 'n') or (instructionsYN = 'N'));
    if (instructionsYN = 'y') or (instructionsYN = 'Y') then begin
        instructions;
    end;
    repeat
        writeln;
        writeln('What mode do you want to play? Remember, only press "1" or "2"');
        writeln;
        readln(mode);
        while ((mode<>1)and(mode<>2)) do begin //thats for someone's who don't read instructions
            writeln('Did you forget to put your glasses on? Go get them and type one of the allowed numbers... I"ve got all day.');
            readln(mode);
            end;
        chargingModule;
        picCreator(pic); // create the picture of the hangman and insert in array

        case mode of
            1: ClassicFirstModule(wordd,show);
            2:  begin //IA DETAILS FOR MISTAKE IN THE "nounlist.txt"
                    wordd := randomword;
                    if wordd = '' then
                    begin
                        writeln;
                        writeln('Returning to main menu...');
                        Exit; // Exit mainMenu to avoid starting the game
                    end;
                end;
            end;
        loadArray(logic_dim,arrayy,wordd);
        mainAxis(logic_dim,arrayy,wordd,show,pic);
        repeat
            if (mode=1) then begin
                writeln('So... Do YOU and your FRIEND want to PLAY AGAIN? y/n');
            end
            else begin
                writeln('So... Do YOU want to PLAY AGAIN? y/n');
            end;
            readln(endd);
            until ((endd = 'y') or (endd = 'Y') or (endd = 'n') or (endd = 'N'));
        until((endd='n') or (endd='N'));
end;

begin           // main program
    
    mainMenu;
    writeln('Press enter to exit.');
    readln;
end.
