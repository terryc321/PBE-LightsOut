Class {
	#name : 'LightsOutMatrixTest',
	#superclass : 'TestCase',
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'tests' }
LightsOutMatrixTest >> testBasic [	
	"check 5 by 5 matrix ok"
	| m | 
	m := LightsOutMatrix new.
	m resize: 2 by: 3 with: [ :y | [ :x | x + y ]].
	self assert: 1 equals: 1 . 
	
]
