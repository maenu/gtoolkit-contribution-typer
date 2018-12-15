Class {
	#name : #TypGtCheckBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtCheckBodyStyler >> styleNode: aNode withText: aString [
	self
		styleFrom: aNode start
		to: aNode stop
		with:
			{(BlTextUnderlineAttribute new
				paint: Color red;
				yourself).
			(TypGtCheckErrorAttribute new
				text: aString;
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitAssignmentNode: aNode [
	super visitAssignmentNode: aNode.
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode withText: 'expected ' , e expected asString , ', got ' , e actual asString ]
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitMessageNode: aNode [
	super visitMessageNode: aNode.
	[ aNode typCheCheckMethod ]
		on: TypCheNoMethodError
		do: [ :e | self styleNode: aNode withText: 'method ' , e selector asString , ' not found in ' , e type asString ].
	aNode arguments
		withIndexDo: [ :e :i | 
			[ aNode typCheCheckArgumentCompatibilityAt: i ]
				on: TypCheIncompatibleTypeError
				do: [ :f | self styleNode: e withText: 'expected ' , f expected asString , ', got ' , f actual asString ] ]
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
						"pattern styler only gets pruned AST, use original for icon"
						background: aNode method ast typCheColor;
						constraintsDo: [ :c | 
							c horizontal exact: 16.
							c vertical exact: 16 ];
						margin:
							(BlInsets
								top: 0
								right: 2
								bottom: 0
								left: 2) ];
				yourself)}
]

{ #category : #visiting }
TypGtCheckBodyStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	[ aNode typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode withText: 'expected ' , e expected asString , ', got ' , e actual asString ]
]
