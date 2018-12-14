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
	[ aNode typCheIsCompatible ]
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
TypGtCheckBodyStyler >> visitReturnNode: aNode [
	super visitReturnNode: aNode.
	[ aNode typCheIsCompatible ]
		on: TypCheIncompatibleTypeError
		do: [ :e | self styleNode: aNode withText: 'expected ' , e expected asString , ', got ' , e actual asString ]
]
