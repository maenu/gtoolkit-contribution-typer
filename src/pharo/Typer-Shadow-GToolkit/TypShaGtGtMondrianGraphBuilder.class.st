Class {
	#name : #TypShaGtGtMondrianGraphBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrianGraphBuilder class >> shadowedClass [
	^ GtMondrianGraphBuilder class
]

{ #category : #accessing }
TypShaGtGtMondrianGraphBuilder >> ___stencil: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {TypUnknownType instance}
				result: BlElement typAsType
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
