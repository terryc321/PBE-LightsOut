Class {
	#name : 'LightsOutGameTest',
	#superclass : 'TestCase',
	#category : 'PBE-LightsOut',
	#package : 'PBE-LightsOut'
}

{ #category : 'tests' }
LightsOutGameTest >> testDummy [
 "kludge - test methods have to start with test"
 self assert: 1 equals: 2 - 1 .


]

{ #category : 'tests' }
LightsOutGameTest >> testXY [
 "can we get [1,1] from matrix of [2,2]"
 | m obj |
 m := LightsOutGame new openInWorld. 
 obj := m at: 1 at: 1 .
 self assert: (obj className) equals: #LightsOutCell .




]
