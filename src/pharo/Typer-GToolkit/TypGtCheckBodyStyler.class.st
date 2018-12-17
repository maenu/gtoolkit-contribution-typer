Class {
	#name : #TypGtCheckBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtCheckBodyStyler >> styleFrom: anInteger to: anotherInteger color: aColor [
	(text attributesAt: anotherInteger) detect: [ :e | e isKindOf: BlTextUnderlineAttribute ] ifFound: [ "do not layer underlines" ^ self ] ifNone: [  ].
	self
		styleFrom: anInteger
		to: anotherInteger
		with:
			{(BlTextUnderlineAttribute new
				paint: (aColor alpha: 0.3);
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode color: aColor [
	self styleFrom: aNode start to: aNode stop color: aColor
]

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode text: aString color: aColor [
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

{ #category : #'as yet unclassified' }
TypGtCheckBodyStyler >> styleSelectorOf: aMessageNode color: aColor [
	aMessageNode keywordsIntervals do: [ :e | self styleFrom: e first to: e last color: aColor ]
]

{ #category : #'as yet unclassified' }
TypGtCheckBodyStyler >> styleSelectorOf: aMessageNode text: aString color: aColor [
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
TypGtCheckBodyStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode text: 'expected ' , e expected asString , ', got ' , e actual asString color: Color red ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	[ aNode typCheCheckMethod.
	aNode receiver typType nullable
		ifTrue: [ self styleSelectorOf: aNode color: Color yellow ].
	aNode receiver typType isUnknown
		ifTrue: [ self styleSelectorOf: aNode color: Color blue ] ]
		on: TypCheNoMethodError
		do: [ :e | self styleSelectorOf: aNode text: 'method ' , e selector asString , ' not found in ' , e type asString color: Color orange ].
	aNode arguments
		withIndexDo: [ :e :i | 
			[ aNode typCheCheckArgumentCompatibilityAt: i.
			(aNode typTypeForArgumentAt: i) isUnknown
				ifTrue: [ self styleNode: e color: Color blue ] ]
				on: TypCheIncompatibleTypeError
				do: [ :f | self styleNode: e text: 'expected ' , f expected asString , ', got ' , f actual asString color: Color red ] ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMethodNode: aNode [
	| position |
	super visitMethodNode: aNode.
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
						background:
							([ aNode method ast typCheColor ]
								on: Error
								do: [ Halt now ]);
						constraintsDo: [ :c | 
							c horizontal exact: 16.
							c vertical exact: 16 ];
						margin:
							(BlInsets
								top: 0
								right: 2
								bottom: 0
								left: 2)
					"pattern styler only gets pruned AST, use original for icon" ];
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode text: 'expected ' , e expected asString , ', got ' , e actual asString color: Color red ]
]
