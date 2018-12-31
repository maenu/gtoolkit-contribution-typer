Class {
	#name : #TypGtCheckBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtCheckBodyStyler >> styleFrom: anInteger to: anotherInteger color: aColor [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Integer'>
	<typTypeArgument: 3 as: 'Color'>
	(text attributesAt: anotherInteger)
		detect: [ :e | e isKindOf: BlTextUnderlineAttribute ]
		ifFound: [ "do not layer underlines" ^ self ]
		ifNone: [  ].
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

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode text: aString color: aColor [
	<typTypeArgument: 1 as: 'RBProgramNode'>
	<typTypeArgument: 2 as: 'String<Character>'>
	<typTypeArgument: 3 as: 'Color'>
	self styleNode: aNode color: aColor.
	self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(TypGtCheckErrorAttribute new
				text: aString;
				color: aColor;
				yourself)}
]

{ #category : #accessing }
TypGtCheckBodyStyler >> styleSelectorOf: aMessageNode color: aColor [
	<typTypeArgument: 1 as: '{RBMethodNode,RBMessageNode}'>
	<typTypeArgument: 2 as: 'Color'>
	aMessageNode keywordsIntervals
		do: [ :e | self styleFrom: e first to: e last color: aColor ]
]

{ #category : #accessing }
TypGtCheckBodyStyler >> styleSelectorOf: aMessageNode text: aString color: aColor [
	<typTypeArgument: 1 as: 'RBMessageNode'>
	<typTypeArgument: 2 as: 'String<Character>'>
	<typTypeArgument: 3 as: 'Color'>
	self styleSelectorOf: aMessageNode color: aColor.
	self
		styleFrom: aMessageNode receiver stop
		to: aMessageNode receiver stop
		with:
			{(TypGtCheckErrorAttribute new
				text: aString;
				color: aColor;
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	aNode typType isUnknown
		ifTrue: [ self styleNode: aNode color: Color blue ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | 
			self
				styleNode: aNode
				text: 'expected ' , e expected asString , ', got ' , e actual asString
				color: Color red ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	[ aNode typCheCheckMethod.
	[ aNode typCheCheckReceiver ]
		on: TypCheNullableTypeError
		do: [ self styleSelectorOf: aNode color: Color purple ].
	aNode receiver typType isUnknown
		ifTrue: [ self styleSelectorOf: aNode color: Color blue ] ]
		on: TypCheNoMethodError
		do: [ :e | self styleSelectorOf: aNode text: 'method ' , e selector asString , ' not found in ' , e type asString color: Color orange ].
	aNode arguments
		withIndexDo: [ :e :i |
			[ [ aNode typCheCheckArgumentCompatibilityAt: i.
			(aNode typTypeForArgumentAt: i) isUnknown
				ifTrue: [ self styleNode: e color: Color blue ] ]
				on: TypCheIncompatibleTypeError
				do: [ :f | self styleNode: e text: 'expected ' , f expected asString , ', got ' , f actual asString color: Color red ] ]
				on: TypCheNullableTypeError
				do: [ self styleNode: e color: Color purple ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMethodNode: aNode [
	| position |
	super visitMethodNode: aNode.
	aNode typCheHasUnknownReturn
		ifTrue: [ self styleSelectorOf: aNode color: Color blue ].
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
							c horizontal exact: 16.
							c vertical exact: 16 ];
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
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode text: 'expected ' , e expected asString , ', got ' , e actual asString color: Color red ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitTemporaryNode: aNode [
	super visitTemporaryNode: aNode.
	(aNode typIsDeclaration and: [ aNode typType isUnknown ])
		ifTrue: [ self styleNode: aNode color: Color blue ]
]
