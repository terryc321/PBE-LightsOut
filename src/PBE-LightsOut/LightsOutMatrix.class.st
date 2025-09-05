"
dumb dictionary lookup for x y becomes (x@y) 
similarly to put value into matrix , just at:(x@y) put: z. 

"
Class {
	#name : 'LightsOutMatrix',
	#superclass : 'Object',
	#instVars : [
		'arr2',
		'width',
		'height'
	],
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'nested dictionaries' }
LightsOutMatrix >> arr2 [
"introspection"
 ^ arr2 .




]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> at: x at: y [ 
 | row |
" bit quirky get row then column "
 row := (arr2 at: y).
 ^ row at: x.




]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> at: x at: y put: z [
 | row |
"get row then column then put something there"
 row := (arr2 at: y).
 ^ row at: x put: z.





]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> height [
 ^ height. 





]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> height: h [
 height := h .
 ^ self .




]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> initialize [ 
  "we dont actually do anything yet - since do not know width height required"


]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> resize: w by: h with: aBlock [
"set width and height , then array of arrays"
   width := w .
   height := h .
	arr2 := Array new: h . 
	1 to: h do: [ :y | arr2 at: y put: (Array new: w) ].	 
	1 to: h do: [ :y | 1 to: w do: [ :x | (arr2 at: y) at: x put: nil ]].
	1 to: h do: [ :y | 1 to: w do: [ :x | (arr2 at: y) at: x put: ((aBlock value: y) value: x) ] ].
	



]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> tabulate: aBlock [ 
 1 to: width do:[ :w |
	1 to: height do: [ :h | (aBlock value: w)  value: h ]].
 ^ self




]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> width [
 ^ width. 




]

{ #category : 'nested dictionaries' }
LightsOutMatrix >> width: w [
 width := w .
 ^ self .




]
