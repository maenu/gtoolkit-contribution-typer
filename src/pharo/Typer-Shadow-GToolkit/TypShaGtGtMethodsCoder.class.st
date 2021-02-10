Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#instVars : [
		'___methods',
		'___methodCoders'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtMethodsCoder class >> ___forMethods: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' -> CompiledMethod typAsType)} asDictionary ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> ___announce: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Announcement typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> initialize [
	super initialize.
	___methods := SequenceableCollection typAsType
		copyWithParameters: {('@A' -> CompiledMethod typAsType)} asDictionary.
	___methodCoders := SequenceableCollection typAsType
		copyWithParameters: {('@A' -> GtMethodCoder typAsType)} asDictionary
]
