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
	markUnknowns := true
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
TypGtCheckStyler >> styleNode: aNode error: anError message: aString [

	self
		styleFrom: aNode stop
		to: aNode stop
		attribute: (TypGtCheckAttribute
				 subject: anError
				 color: anError color
				 message: aString)
]

{ #category : #visiting }
TypGtCheckStyler >> styleNodeUnknown: aNode message: aString [

	self
		styleFrom: aNode stop
		to: aNode stop
		attribute:
		(TypGtCheckAttribute
			 subject: aNode
			 color: Color blue
			 message: aString)
]

{ #category : #visiting }
TypGtCheckStyler >> visitArgumentNode: aNode [

	super visitArgumentNode: aNode.
	aNode typInfType isUnknown ifTrue: [ 
		markUnknowns ifTrue: [ self styleNodeUnknown: aNode message: 'Argument is unknown' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitAssignmentNode: aNode [

	super visitAssignmentNode: aNode.
	aNode value typInfType isUnknown
		ifTrue: [ 
			markUnknowns ifTrue: [ 
				self styleNodeUnknown: aNode value message: 'Value is unknown' ] ]
		ifFalse: [ 
			[ aNode typCheCheckCompatibility ]
				on: TypCheError
				do: [ :e | 
					self
						styleNode: aNode value
						error: e
						message: 'Assignment is incompatible' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMessageNode: aNode [

	super visitMessageNode: aNode.
	aNode receiver typInfType isUnknown
		ifTrue: [ 
			markUnknowns ifTrue: [ 
				self styleNodeUnknown: aNode message: 'Receiver is unknown' ] ]
		ifFalse: [ 
			[ aNode typCheCheckMethod ]
				on: TypCheError
				do: [ :e | 
					self styleNode: aNode error: e message: 'Method does not exist' ].
			[ aNode typCheCheckReceiver ]
				on: TypCheError
				do: [ :e | 
					self styleNode: aNode error: e message: 'Receiver could be nil' ] ].
	aNode arguments withIndexDo: [ :e :i | 
		(e typInfType isUnknown or: [ 
			 (aNode typInfMethod argumentAt: i) isUnknown ])
			ifTrue: [ 
				markUnknowns ifTrue: [ 
					self styleNodeUnknown: e message: 'Argument is unknown' ] ]
			ifFalse: [ 
				[ aNode typCheCheckArgumentCompatibilityAt: i ]
					on: TypCheError
					do: [ :f | 
						self
							styleNode: e
							error: f
							message:
							('Argument {1} is incompatible' format: { i asString }) ] ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMethodNode: aNode [

	super visitMethodNode: aNode.
	aNode typCheHasUnknownResult ifTrue: [ 
		markUnknowns ifTrue: [ 
			self styleNodeUnknown: aNode message: 'Result is unknown' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitReturnNode: aNode [

	super visitReturnNode: aNode.
	aNode typInfType isUnknown
		ifTrue: [ 
			markUnknowns ifTrue: [ 
				self styleNodeUnknown: aNode message: 'Return is unknown' ] ]
		ifFalse: [ 
			[ aNode typCheCheckCompatibility ]
				on: TypCheError
				do: [ :e | 
					self
						styleNode: aNode
						error: e
						message: 'Return type is incompatible' ].
			[ aNode typCheCheckNullables ]
				on: TypCheError
				do: [ :e | 
					self
						styleNode: aNode
						error: e
						message: 'Return nullness is incompatible' ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitTemporaryNode: aNode [

	super visitTemporaryNode: aNode.
	(aNode isDefinition and: [ aNode typInfType isUnknown ]) ifTrue: [ 
		markUnknowns ifTrue: [ 
			self styleNodeUnknown: aNode message: 'Temp is unknown' ] ]
]
