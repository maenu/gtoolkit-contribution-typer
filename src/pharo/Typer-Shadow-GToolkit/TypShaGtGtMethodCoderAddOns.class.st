Class {
	#name : #TypShaGtGtMethodCoderAddOns,
	#superclass : #TypShaShadow,
	#instVars : [
		'___stylers',
		'___modified'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns class >> shadowedClass [
	^ GtMethodCoderAddOns class
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addMainAction: _a icon: _b action: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ Form typAsType ]
						ifFalse: [ BlockClosure typAsType
								asFunctionType: {}
								result: TypUnknownType instance
								optionalParameters: false ] ] ];
		resultType: [ :a :s :r | 'GtMethodCoderAddOns' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addShortcut: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | BlShortcut typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addStyler: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtCoderBodyStyler typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___stylers [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {GtCoderBodyStyler typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> initialize [
	super initialize.
	___stylers := TypVariableResolver new
		type: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {GtCoderBodyStyler typAsType} ];
		yourself.
	___modified := TypVariableResolver new
		type: [ :a :s :r | Set typAsType asParametricType: {Symbol typAsType} ];
		yourself
]
