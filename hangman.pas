program hangman;
const MAX_LIFES = 7;
type
    range = 1..44;
    range2 = 0..7;
    drawing = record                                           // picture of a hangman like the papers stile. it's change if you add losted lifes.
        draw3: string;
        draw2: string;
        draw1: string;
        draw0: string;// array of word, 44 words is most that i think is needed.
    end;
    letters = array[range] of char;   
    picture = array[range2] of drawing;                             // array of strings to make some graphics designs!




//Just a few simple dialogue procedures   // note: i need to clarify where come all the modules
procedure welcome;
begin
    writeln('-----------------------------WELCOME TO HANGMAN!!!!-----------------------------');
    writeln;
    writeln('CHOOSE ONE OPTION: (just press some of that numbers and enter)');
    writeln('1- Classic');
    // writeln('2- Competitive (1v1 with 2 words)');
    // writeln('3- One Player Mode');
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




// Tinys procedures
procedure loadArray ( var lD:integer; var arr:letters ; wordd:string);      // load array of char with '_'
var
    i: integer;
begin
    lD:=length(wordd);
    for i:=1 to lD do
        arr[i]:='_';
end;
procedure sameWord (var arr:letters;lD:integer;word:string);
var
    i:integer;
begin
    for i:=1 to lD do
        arr[i]:=word[i];  // select one 'char' per vector of the array of string
end;
procedure showSomeLetters(lD:integer;a:letters;totL:integer); // show the letters you have at the moment
var
    aux:integer;i:integer;
begin                     
    aux:=  lD-totL;
    writeln;
    write('    "');
    for i:=1 to lD do
        write(a[i],' ');
    if aux<=2 then begin
        write(aux,'letters left! You can do it?');
    end
    else
        write(aux,'letters left!');
end;
procedure chargingDelay (ms:integer);
var
    i,j:integer;
begin
    for i:=1 to ms do         // just a delay
        for j:=1 to 50 do
        ;
end;
procedure chargingModule;
var
    i,j:integer;
begin
    writeln;
    writeln;
    writeln('                Charging');
    for i:=1 to 2 do begin
        for j:=1 to 3 do begin
           chargingDelay(20);
           write('.');
           end;
        end;
    writeln('                [');
    for i:=1 to 8 do begin
        chargingDelay(60);
        write('-');
        end;
    write(']');
    writeln;
    writeln;
end;
procedure picModule (pic:picture;lostLf:integer);
begin
    writeln(pic[lostLf].draw3);
    writeln(pic[lostLf].draw2);
    writeln(pic[lostLf].draw1);
    writeln(pic[lostLf].draw0);
    writeln('___    ');
end;
procedure picCreator (var pic:picture);
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
    pic[5].draw0:=' |';
    pic[6].draw3:=' ___';
    pic[6].draw2:=' | o';
    pic[6].draw1:=' |/|\';
    pic[6].draw0:=' |/';
    pic[7].draw3:=' ___';
    pic[7].draw2:=' |(.';
    pic[7].draw1:=' |/|\              ||YOU LOSE!||';
    pic[7].draw0:=' |/ \';
end;
procedure searchAndInsert(var a:letters;w:string;var totL:integer;uL:char;var lL:range2;var tries:integer;lD:integer);   // For any position of the array string compare if input letter is the same,
var                                             // same of the entrys but reduced                                       // next this insert the letter to the correct position in our array
    i,aux:integer;
begin
    aux:= 0;
    tries:= tries+1;           //only increments with any play you do
    for i:=1 to lD do begin                                           
        if( w[i] = uL ) then begin
            a[i]:= uL;
            totL:= totL+1;
            aux:= aux+1;
            end;
        end;

    if ( aux = 0 ) then begin  //if the letter wasn't correct, you lost one life
        lL:= lL+1;
    end;
end;



// Biggest and complex procedures
procedure ClassicFirstModule ( var wrd:string; var show:boolean );    // The firsts questions to start a game.
var
    aux:char; // confirmation auxiliar variable
begin
   repeat
        writeLn('---------------------------------');
        writeLn( 'WRITE your WORD and PRESS ENTER (all in lowercase)' );
        writeLn('---------------------------------');
        write('--> ');read( wrd );
        writeLn( 'Confirm? y/n' );
        readLn(aux);

        until((aux = 'y') or (aux = 'n') or (aux = 'Y') or (aux = 'N'));
        
   repeat
        writeLn( 'In the end of the game you want to show your CHOOSED WORD?' );
        readLn( aux );
        until((aux = 'y') or (aux = 'n') or (aux = 'Y') or (aux = 'N'));

        if ((aux = 'y') or (aux = 'Y')) then begin
            show:= true;
        end
        else
            show:= false;
end;
procedure takeTheRiskChallenge (wrd:string;a:char;a2:string;var totL:integer;lD:integer;var tries:integer);
var
    i:integer;
begin
    writeln('WRITE the CORRECT WORD (if you lose, you"re going to lose 2 lifes)');
    read(a2);
    tries:=tries+1;
    if (a2 = wrd) then begin
        totL:=lD;
    end
    else begin
        if (i<4) then begin
            writeln('Another opportunity? (But if you accept and lose, you lose the game) y/n');
            readln(aux);
            if ((a = 'y') or (a = 'Y')) then begin
                writeln('WRITE your ANSWER (only lowercase)');
                readln(a2);
                tries:=tries+1;
                if (a2 = wrd) then begin
                    totL:=lD;
                end
                else
                    lL:=lL+7;
            end;
     end;
end;
procedure takeTheRisk(var wrd:string;var totL:integer;var lL:range2;lD:integer;var tries:integer);  // if the player know the word he can win or lose 2 lifes
var
    aux:char; aux2:string;
begin
    writeln;
    writeLn('---------------------------------');
    writeLn( ' UNIQUE AND RISKY OPPORTUNITY' );
    writeLn('---------------------------------');
    writeLn('    Take? y/n -->');read(aux);
    writeLn;
    if (aux = 'y') or (aux = 'n') or (aux = 'Y') or (aux = 'N') then begin
        makeMistake;
        end;
    if ((aux = 'y') or (aux = 'Y')) then begin
        writeLn('-----------------------------------------');
        writeln('IF YOU SAY THE COMPLETE WORD YOU CAN WIN');
        writeLn('-----------------------------------------');
        writeLn;
        writeLn('You are agree with that shit? y/n'); read(aux);
        if (aux = 'y') or (aux = 'n') or (aux = 'Y') or (aux = 'N') then
            makeMistake2;

        if ( (aux = 'n') or (aux = 'N') ) then begin
            writeLn('You just lost 1 life for being a pussy. You see that?');
            lL:=lL-1;
        end;
        if ( (aux = 'y') or (aux = 'Y')) then begin
            cantGoOut;
            takeTheRiskChallenge(wrd,aux,aux2,totL,lD,tries);
        end;
    end;
end;
procedure possibleChallenge (var totL:integer;var aux:boolean;var wrd:string;var lostLifes:range2;lD:integer;var tries:integer;);    
begin
    if ((totL>2) and (aux=false)) then begin
        takeTheRisk(wrd,totL,lostLifes,lD,tries);                           // This give you the possibility to risk and say the correct word in one time of the game.
        aux:=true;
    end;
end;
procedure winner_Loser (lL:range2;show:boolean;pic:picture;tries:integer;arr:letters;lD:integer;word:string);
var
    aux:boolean;
begin
    if (lL=7) then begin
        picModule(pic,lL);
        writeln;
        writeLn('--------------------------------------------');
        writeln('YOU LOSE THE ',lF,' LIFES IN ',tries,' tries');
        if show then
            writeln('The correct answer was: ',word);
            sameWord (arr,lD,word);              // This inserts the word letter by letter in array 
            showSomeLetters(lD,arr,totL);        // To show in display like hangman
        else
            writeln('The WORD PICKER don"t want to show the CORRECT ANSWER.');
    end
    else begin
        winner;
        writeln('You GUESSED the word in ', tries,' TRIES, losing ',lL,' LIFES.' );
        case aux of
            'y', 'Y': ...;
            'n', 'N': ...;  //shitty
        else
            makeMistake;
        end;
        if (tries >= 20) then
             writeln('OH MEN... You have some mental problem! WTF ARE YOU DOING'); // easter egg
        if (tries >= 4) then
            writeln('Come on! You can do this better!');
        else if (tries > 1) and (tries < 3) then
                writeln('Ok... it"s just the normal stuff');
        end;
        else if (tries = 1) then
                writeln('WELL PLAYED MAN! JUST THE ONE PERCENT...but, between you and me... you have some cheat or something?');
    end;
    writeln;
    writeln;
    writeln;
    writeln('-- GAME OVER --');        
    end;
end;
procedure mainAxis (lD:integer;arr:letters;wrd:string;show:boolean,pic:picture);  //This is the most important PROCESS, the life of the program the MAIN AXIS!
var                                                                   
    usrL:char;
    aux:boolean; // This put on when you are playing well the game
    totL:integer; // total letters
    lostLifes:range2; // losted lifes
    tries:integer; // counter of tries
begin
    totL:=0;
    tries:=0;  // counter
    aux:=false;
    lostLifes:=0; // losted lifes
    writeLn('---------------------------------');
    writeLn( 'LET''S START THE GAME!' );
    writeLn('---------------------------------');
    writeLn('The word has ',lD,' letters, you have ',MAX_LIFES,' lifes.');

    while (totL<lD) and (lostLifes<MAX_LIFES) do begin                         // To stop when: 'total letters' are the same of 'word' and lostLifes has a 7
        writeLn('Insert some letter and press enter, COME ON!');
        readLn(usrL);

        searchAndInsert(arr,wrd,totL,usrL,lostLifes,tries);            // search and insert letters in array
        picModule(pic,lostLifes);
        showSomeLetters(lD,arr,totL);
        possibleChallenge(totl,aux,wrd,lostLifes,lD,tries);
        
    end;    
    chargingModule;
    winner_Loser (lostLifes,show,pic,tries,arr,lD,wrd);
end;
procedure mainMenu;
var
    word: string;
    endd: char;
    show: boolean;
    arrayy: letters;
    mode,logic_dim: integer;
    pic: picture;
begin

    repeat
        welcome;
        readln(mode);
        chargingModule;
        picCreator(pic); // create the picture of the hangman and insert in array

        case mode of
            1: ClassicFirstModule(word,show);
            2: exit;
        end;
        loadArray(logic_dim,arrayy,word);
        mainAxis(logic_dim,arrayy,word,show,pic);
        writeln('You want to GO to the MAIN MENU? y/n');
        until ((endd = 'n') or (endd = 'N'));

end;

begin           // main program
    mainMenu;
end;