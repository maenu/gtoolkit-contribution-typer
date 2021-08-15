Class {
	#name : #TypGtCheckStyler,
	#superclass : #TypGtRbAstStyler,
	#instVars : [
		'markUnknowns'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #initialization }
TypGtCheckStyler >> initialize [
	super initialize.
	markUnknowns := false
]

{ #category : #accessing }
TypGtCheckStyler >> markUnknowns [
	^ markUnknowns
]

{ #category : #accessing }
TypGtCheckStyler >> markUnknowns: anObject [
	markUnknowns := anObject
]

{ #category : #visiting }
TypGtCheckStyler >> styleFrom: anInteger to: anotherInteger attribute: anAttribute [

	<typPraArguments: 'Integer,Integer,BlTextAttribute'>
	self styleFrom: anInteger to: anotherInteger with: { anAttribute }
]

{ #category : #visiting }
TypGtCheckStyler >> styleNode: aNode error: aTypCheError [

	self shouldBeImplemented
]

{ #category : #visiting }
TypGtCheckStyler >> styleNodeUnknown: aNode because: aString [

	self shouldBeImplemented
]

{ #category : #visiting }
TypGtCheckStyler >> visitArgumentNode: aNode [

	super visitArgumentNode: aNode.
	aNode typInfType isUnknown ifTrue: [ 
		markUnknowns ifTrue: [ self styleNodeUnknown: aNode because: 'Argument is unknown' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	aNode value typInfType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNodeUnknown: aNode value because: 'Value is unknown' ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility ]
				on: TypCheError
				do: [ :e | self styleNode: aNode value error: e ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMessageNode: aNode [

	super visitMessageNode: aNode.
	aNode receiver typInfType isUnknown
		ifTrue: [ 
			markUnknowns ifTrue: [ 
				self styleNodeUnknown: aNode because: 'Receiver is unknown' ] ]
		ifFalse: [ 
			[ 
			aNode typCheCheckMethod.
			aNode typCheCheckReceiver ]
				on: TypCheError
				do: [ :e | self styleNode: aNode error: e ] ].
	aNode arguments withIndexDo: [ :e :i | 
		(e typInfType isUnknown or: [ 
			 (aNode typInfMethod argumentAt: i) isUnknown ])
			ifTrue: [ 
				markUnknowns ifTrue: [ 
					self styleNodeUnknown: e because: 'Argument is unknown' ] ]
			ifFalse: [ 
				[ aNode typCheCheckArgumentCompatibilityAt: i ]
					on: TypCheError
					do: [ :f | self styleNode: e error: f ] ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMethodNode: aNode [

	super visitMethodNode: aNode.
	aNode typCheHasUnknownResult ifTrue: [ 
		markUnknowns ifTrue: [ 
			self styleNodeUnknown: aNode because: 'Result is unknown' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitReturnNode: aNode [

	super visitReturnNode: aNode.
	aNode typInfType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNodeUnknown: aNode because: 'Return is unknown'] ]
		ifFalse: [ 
			[ 
			aNode typCheCheckCompatibility.
			aNode typCheCheckNullables ]
				on: TypCheError
				do: [ :e | self styleNode: aNode error: e ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitTemporaryNode: aNode [

	super visitTemporaryNode: aNode.
	(aNode isDefinition and: [ aNode typInfType isUnknown ]) ifTrue: [ 
		markUnknowns ifTrue: [ 
			self styleNodeUnknown: aNode because: 'Temp is unknown' ] ]
]
