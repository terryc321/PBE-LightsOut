Class {
	#name : 'LightsOutCell',
	#superclass : 'SimpleSwitchMorph',
	#instVars : [
		'action',
		'before'
	],
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'initialization' }
LightsOutCell >> doButtonAction [ 
 "redirect to trigger"
 self trigger .

]

{ #category : 'initialization' }
LightsOutCell >> initialize [ 
 super initialize .
 self offColor: Color yellow.
 self onColor:  Color blue.
 self useSquareCorners .
 self label: ''.
 self borderWidth: 2 .
 self extent: 16@16.
 self turnOff.
"initialize automatically returns self"


]

{ #category : 'initialization' }
LightsOutCell >> mouseDown: evt [
 "do nothing when mouse up"
 before := self isOn.










   


]

{ #category : 'initialization' }
LightsOutCell >> mouseUp: evt [
 "do nothing when mouse up"
 self trigger .
 "ensure consistency on board , cannot trigger itself "
 before ifTrue: [ self turnOn ] ifFalse: [ self turnOff ] .









   


]

{ #category : 'initialization' }
LightsOutCell >> trigger [
 action value.





   


]

{ #category : 'initialization' }
LightsOutCell >> trigger: aBlock [
 "save closure for later when cell is to be triggered."
 action := aBlock.








   


]
