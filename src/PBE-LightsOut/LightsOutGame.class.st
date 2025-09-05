"
this has the best comment

and this is a second comment

this is a third comment

do not edit any of this from outside of pharo or pharo will fall over
kinda makes wonder how do you keep up to date if somebody merges their changes to github ?

"
Class {
	#name : 'LightsOutGame',
	#superclass : 'BorderedMorph',
	#instVars : [
		'cells',
		'cellsPerSide'
	],
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'initialization' }
LightsOutGame >> at: x at: y [ 
 ^ cells at: x at: y.



]

{ #category : 'initialization' }
LightsOutGame >> cells [
 ^ cells .


]

{ #category : 'initialization' }
LightsOutGame >> cellsPerSide [
 ^ cellsPerSide . 



]

{ #category : 'initialization' }
LightsOutGame >> initialize [ 
 "smalltalk kludge"
 super initialize.

 self resizeBoard: 10 . 

]

{ #category : 'initialization' }
LightsOutGame >> isSolved [
 | w h |

w := self cellsPerSide.
h := w.

"initial state board - is everything is off . solved when everything is on . "

"if cellsPerSide is defined then there should be cells to delete"
1 to: w do: [ :x | 
	1 to: h do: [ :y | 
		| c | 
		c := (cells at: x at: y).
		"its off if not isOn , bit confusing"
		c isOn ifFalse: [ ^ False ]]].
"all squares in the grid are on - so we are solved"
^ True.

]

{ #category : 'initialization' }
LightsOutGame >> newCellAt: i at: j [
"Create a cell for position (i,j) and add it to my on-screen
representation at the appropriate screen position. Answer the
new cell"
| c origin |
c := LightsOutCell new.
origin := self innerBounds origin.
self addMorph: c.
c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
c trigger: [ self toggleNeighboursOfCellAt: i at: j ].
^ c .


]

{ #category : 'initialization' }
LightsOutGame >> reset [ 
"turn off all the switches "
| w h |
w := cells width.
h := cells height.
1 to: w do:[ :x | 
	1 to: h do: [ :y | 
		(cells at: x at: y) turnOff ]].


]

{ #category : 'initialization' }
LightsOutGame >> resizeBoard: n [ 
 | sampleCell width height n |

"if cellsperside is defined then there should be cells to delete"
((self cellsPerSide) = nil) ifFalse: [  
"delete cells exist already"
1 to: (self cellsPerSide) do: [ :x | 
	1 to: (self cellsPerSide) do: [ :y | 
		(cells at: x at: y) delete  ] ]].


 "set number of cells per side as n"
 cellsPerSide := n.

 "make a default cell and get its width height"
 sampleCell := LightsOutCell new.
 width := sampleCell width.
 height := sampleCell height.

 "compute size this container square needs to be "
 self bounds: (0 @ 0 extent: ((width * n) + 20) @ ((height * n) + (10 * self borderWidth) + 20)) . 
 self position: 100@100 . 

 "cells are actual morphs - grid of n x n morphs accessible through cells "
 cells :=  LightsOutMatrix new .
 cells resize: n by: n with: [ :y | [ :x | self newCellAt: x at: y ]].






]

{ #category : 'initialization' }
LightsOutGame >> toggleNeighboursOfCellAt: i at: j [


i > 1 
ifTrue: [ (cells at: i - 1 at: j) toggleState ].

i < self cellsPerSide 
ifTrue: [ (cells at: i + 1 at: j) toggleState ].

j > 1 
ifTrue: [ (cells at: i at: j - 1) toggleState ].

j < self cellsPerSide 
ifTrue: [ (cells at: i at: j + 1) toggleState ] .

]
