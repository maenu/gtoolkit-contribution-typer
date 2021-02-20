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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ Form typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {}
								argumentsOptional: false
								signalsAlways: false ] ] ];
		resultType: [ :a :s :r | 'GtMethodCoderAddOns' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addShortcut: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlShortcut typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addStyler: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtCoderBodyStyler typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___stylers [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> GtCoderBodyStyler typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> initialize [
	super initialize.
	___stylers := SequenceableCollection typAsType
		copyWithParameters: {('@A' -> GtASTStyler typAsType)} asDictionary.
	___modified := Set typAsType
		copyWithParameters: {('@A' -> Symbol typAsType)} asDictionary
]
