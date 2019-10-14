Class {
	#name : #TypShaGtGtPhlowExplicitView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowExplicitView class >> shadowedClass [
	^ GtPhlowExplicitView class
]

{ #category : #accessing }
TypShaGtGtPhlowExplicitView >> ___stencil: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: BlElement typAsType
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
