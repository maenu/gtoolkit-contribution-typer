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
TypGtCheckStyler >> styleFrom: anInteger to: anotherInteger color: aColor [

	<typPraArguments: 'Integer,Integer,Color'>
	self
		styleFrom: anInteger
		to: anotherInteger
		with: { (BlTextDecorationAttribute new underline
				 color: (aColor alpha: 0.5);
				 thickness: 2) }
]

{ #category : #visiting }
TypGtCheckStyler >> styleNode: aNode color: aColor [
	<typPraArguments: 'RBProgramNode,Color'>
	self styleFrom: aNode start to: aNode stop color: aColor
]

{ #category : #accessing }
TypGtCheckStyler >> styleSelectorOf: aNode color: aColor [
	<typPraArguments: '{RBMethodNode,RBMessageNode},Color'>
	aNode keywordsIntervals
		do: [ :e | self styleFrom: e first to: e last color: aColor ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	aNode typInfType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	aNode value typInfType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode value color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility ]
				on: TypCheError
				do: [ :e | self styleNode: aNode value color: e color ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	aNode receiver typInfType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckMethod.
			aNode typCheCheckReceiver ]
				on: TypCheError
				do: [ :e | self styleSelectorOf: aNode color: e color ] ].
	aNode arguments
		withIndexDo: [ :e :i | 
			(e typInfType isUnknown or: [ (aNode typInfMethod argumentAt: i) isUnknown ])
				ifTrue: [ markUnknowns ifTrue: [ self styleNode: e color: Color blue ] ]
				ifFalse: [ [ aNode typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheError
						do: [ :f | self styleNode: e color: f color ] ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitMethodNode: aNode [

	super visitMethodNode: aNode.
	aNode typCheHasUnknownResult ifTrue: [ 
		markUnknowns ifTrue: [ 
			self styleSelectorOf: aNode color: Color blue ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	aNode typInfType isUnknown
		ifTrue: [ markUnknowns
				ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility.
			aNode typCheCheckNullables ]
				on: TypCheError
				do: [ :e | self styleNode: aNode color: e color ] ]
]

{ #category : #visiting }
TypGtCheckStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	(aNode isDefinition and: [ aNode typInfType isUnknown ])
		ifTrue: [ markUnknowns
				ifTrue: [ self styleNode: aNode color: Color blue ] ]
]
