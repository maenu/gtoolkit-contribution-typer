Class {
	#name : #TypGtCheckBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'markUnknowns'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #initialization }
TypGtCheckBodyStyler >> initialize [
	super initialize.
	markUnknowns := false
]

{ #category : #accessing }
TypGtCheckBodyStyler >> markUnknowns [
	^ markUnknowns
]

{ #category : #accessing }
TypGtCheckBodyStyler >> markUnknowns: anObject [
	markUnknowns := anObject
]

{ #category : #styling }
TypGtCheckBodyStyler >> style: aText ast: anAst [
	anAst typIsTyped
		ifFalse: [ ^ self ].
	super style: aText ast: anAst
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleFrom: anInteger to: anotherInteger color: aColor [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Integer'>
	<typTypeArgument: 3 as: 'Color'>
	self
		styleFrom: anInteger
		to: anotherInteger
		with:
			{(BlTextUnderlineAttribute new
				paint: (aColor alpha: 0.5);
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode color: aColor [
	<typTypeArgument: 1 as: 'RBProgramNode'>
	<typTypeArgument: 2 as: 'Color'>
	self styleFrom: aNode start to: aNode stop color: aColor
]

{ #category : #accessing }
TypGtCheckBodyStyler >> styleSelectorOf: aNode color: aColor [
	<typTypeArgument: 1 as: '{RBMethodNode,RBMessageNode}'>
	<typTypeArgument: 2 as: 'Color'>
	aNode keywordsIntervals
		do: [ :e | self styleFrom: e first to: e last color: aColor ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	aNode typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	aNode value typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode value color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ self styleNode: aNode value color: Color red ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	aNode receiver typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ [ aNode typCheCheckMethod.
			aNode typCheCheckReceiver ]
				on: TypCheNoMethodError
				do: [ self styleSelectorOf: aNode color: Color orange ] ]
				on: TypCheNullableTypeError
				do: [ self styleSelectorOf: aNode color: Color purple ] ].
	aNode arguments
		withIndexDo: [ :e :i | 
			e typType isUnknown
				ifTrue: [ markUnknowns ifTrue: [ self styleNode: e color: Color blue ] ]
				ifFalse: [ [ [ aNode typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheIncompatibleTypeError
						do: [ self styleNode: e color: Color red ] ]
						on: TypCheNullableTypeError
						do: [ self styleNode: e color: Color purple ] ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMethodNode: aNode [
	| position |
	super visitMethodNode: aNode.
	aNode typCheHasUnknownReturn
		ifTrue: [ markUnknowns ifTrue: [ self styleSelectorOf: aNode color: Color blue ] ].
	position := aNode arguments isEmpty
		ifTrue: [ aNode selector size ]
		ifFalse: [ aNode arguments last stop ].
	self
		styleFrom: position
		to: position
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ BlElement new
						background: aNode typCheColor;
						constraintsDo: [ :c | 
							(c horizontal "typCastAs BlLayoutCommonConstraintsAxis") exact: 16.
							(c vertical "typCastAs BlLayoutCommonConstraintsAxis") exact: 16 ];
						margin:
							(BlInsets
								top: 0
								right: 2
								bottom: 0
								left: 2);
						yourself ];
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	aNode typType isUnknown
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
		ifFalse: [ [ aNode typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ self styleNode: aNode color: Color red ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	(aNode typIsDeclaration and: [ aNode typType isUnknown ])
		ifTrue: [ markUnknowns ifTrue: [ self styleNode: aNode color: Color blue ] ]
]
