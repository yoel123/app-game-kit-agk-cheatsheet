
// Project: cheatsheet 
// Created: 2021-05-05

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "cheatsheet" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts



//print to screen
print("hello world")

///////////variables///////////

x = 2 //int

s$ = "im a string"
s$ = s$+" im add to the string"

f# = 0.5 //im a float

print_me$ = "print me bla"

//declare var type
s_2 as string
f_2 as float
s_2 = "bla"
f_2 = 0.6

//math
tantst#=ATan2(1,5) //returns Degrees
costst# = cos(123)
sintst# = sin(123)

yabs = ABS(-100) //absolute value

//global variable
global ggg = 5

/////////loops/////////

//while loop
print_me$ = print_me$+" while loop "
i=0
WHILE i<3

print_me$ = print_me$+" " + Str(i)+" "
inc i
ENDWHILE

//for loop
print_me$ = print_me$+" ||| for loop "
for t = 1 to 4
   print_me$ = print_me$+" " + Str(t)+" "
next t

//break loop is exit 

//continue is continue

///////////arrays//////////

ir as integer[3] 
ir[0] = 1
ir[1] = 2
ir[2] = 3
ir[3] = 4

//collection like
irt as integer[]
irt.insert(999)//add 999 to array
irt.insert(1)
irt.insert(67)
irt.remove(0)//remove first element in array
rlen = irt.length//array length

irnum = irt[0] //get first element in array



sr as String[3] //string array
fr as float[3] //float array

nir as integer[]
nir  = [1,2,3,4] //another way to decare an array

//two dimentionar array

twod as integer[2,2]
twod[0] = [1,2,3]
twod[1] = [1,2,3]
twod[2] = [1,2,3]

//loop array
print_me2$ = " for loop array "
for i = 0 to ir.length
   print_me2$ = print_me2$+" " + Str(ir[i])+" "
next i

//string to array (kinda)

text$="bla,1,two"
word$=GetStringToken(text$,",",1) //get bla

////////////ifs/////////////

printif$ = "print if"

IF 2 < 3 THEN printif$ = printif$ +" in if"

xa = 1

xb = 2
//if else if
IF xa = xb
  xa = 10
  xb = 20
  ELSEIF xa = 2
	  xb=3
  ELSE	
  xa=4
ENDIF

//or and

IF xa = 1 AND xb=2 THEN PRINT ( "ok" )
IF xa = 1 OR xb=2 THEN PRINT ( "ok" )
	
//not operator
if xa <> 2 then xa=0

/*
= is equal to
<> is different to
> is greater than
>= is greater or equal than
< is less than
<= is less or equal than
*/


//////////////////functions///////////////////


//exit function (return)

function exfunc()
        print ( "exit func" )
        exitfunction "bla from function" //return bla
        print ( "didnt exit func" )
endfunction "not bla" //defult return also determins return type...

function plus(n1,n2)
	res = n1+n2
endfunction res //res is the return val

//get string as argument
function say_somthing(s$)
	print(s$)
endfunction 

//random number
function yrand(min,max)
        seed = val(right(GetCurrentTime(),2))
        SetRandomSeed2(seed)
        rand = Random2(min,max)
endfunction rand

rndtst = yrand(1,10)

//pass array as refrence

function passr( a ref as integer[] ) // pass a reference (a is an int array)
    a[0] = 7 //change the  refrence val (the array you passed to the func
endfunction 

//alert box
//Message("im an alert")

/////////////types (lame class/structs)/////////////

//create type
type ypoint
	x as float
	y as float
endtype

//use type

expoint as ypoint

expoint.x = 5.2
expoint.y = 3

//type inside type
type player
	pos as ypoint
	spriteId
	name as string
	angle as float
endtype

//example use 
p1 as player
p1.pos.x = 1
p1.pos.y = 200
p1.name = "bla"
p1.angle = 90.3
p1.spriteId = 3

//function to create a type

function make_player(x as float, y as float,name as string,a as float,sid)
	p as player
	p.pos.x = x
	p.pos.y = y
	p.name = name
	p.angle = a
	p.spriteId = sid
endfunction p 

playa as player

playa = make_player(10,5,"bla bla",50.3,1)

//type array example

type bullet
	pos as ypoint
	spriteId
	dmg
	dirangle as float //direction angle
endtype

function make_bullet(x as float, y as float,sid,dmg,a as float)
	b as bullet
	b.pos.x = x
	b.pos.y = y
endfunction b

//bullets array (global so you can access it from anywhere)
global bs as bullet[]
bs.insert(make_bullet(0,5,3,20,90))
bs.insert(make_bullet(30,50,4,30,190))
bs.insert(make_bullet(330,125,4,90,290))

//loop them (all bullets in bs array)

for i=0 to bs.length

	//current bullet ( bs[i] )
	print(bs[i].pos.x)
	//stuff todo:
	//move by angle 
	//handle hit/collision detection
	//etc
next i


////////////////2d sprites/////////////////////	

global imgid = 1
global spriteid = 1

//load image
LoadImage(imgid,"ph.png") //ph is a blue box ph is short for place holder

//create sprite
CreateSprite(spriteid,imgid)
//set sprite x,y
SetSpritePosition(spriteid,50,400)

//get sprite x,y
sx = GetSpriteX(spriteid)
sy = GetSpriteY(spriteid)

//rotate sprite by angle (degree)
SetSpriteAngle(spriteid,70)
//set sprite opacity (0-255)
SetSpriteColorAlpha(spriteid,159)
//change sprite img
//SetSpriteImage(spriteid,newimgid,1)
//remove sprite
//DeleteSprite(spriteid)

////////////////////file io///////////////////////

//file name
filen as String
filen = "myFile.txt"


//write file to C:\Users\username\AppData\AGKApps\appName
file = OpenToWrite( filen )
//write string
Writeline(file,"bla bla bla")
//write int
WriteInteger ( file, 200 )
//write float
WriteFloat(file,0.5)

//close file when done writinf
CloseFile(file)

printFile as string

//read file
if GetFileExists( filen )
	file = OpenToRead(filen)
	printFile = Readline(file)+" "
	printFile =  printFile + str( readInteger(file) ) +" "
	printFile =  printFile + str( readFloat(file) )+" "
	//close file when done 
	CloseFile(file)
endif


//main loop

do
    

   // Print( ScreenFPS() )
    print("hello world")
    print(print_me$)
    print(print_me2$)
    print(word$)
    print("rand num "+str(rndtst))
    print(printif$)
    print(exfunc())
    say_somthing("somthing")
    say_somthing("file data: "+printFile)
    
    //draw primitives
    ycolor = MakeColor(255,255,255)
    DrawBox( 150, 200, 200, 150,ycolor,ycolor,ycolor,ycolor,0)
    DrawEllipse( 200,230,10,10,ycolor,ycolor,1 )
    drawline(300,300,400,400,ycolor,ycolor)
    Sync()
loop
