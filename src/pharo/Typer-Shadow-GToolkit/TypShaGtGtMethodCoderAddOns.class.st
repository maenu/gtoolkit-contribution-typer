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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ Form typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithArguments: {}
								result: TypUnknownType instance
								argumentsOptional: false ] ] ];
		resultType: [ :a :s :r | 'GtMethodCoderAddOns' typAsType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addShortcut: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | BlShortcut typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___addStyler: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtCoderBodyStyler typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> ___stylers [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> GtCoderBodyStyler typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> initialize [
	super initialize.
	___stylers := SequenceableCollection typAsType
		copyWithBindings: {('@A' -> GtASTStyler typAsType)} asDictionary.
	___modified := Set typAsType
		copyWithBindings: {('@A' -> Symbol typAsType)} asDictionary
]
