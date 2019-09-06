Class {
	#name : #TypShaTypTypChainableResolvers,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Typer'
}

{ #category : #'as yet unclassified' }
TypShaTypTypChainableResolvers class >> shadowedClass [
	^ TypRepository class
]

{ #category : #accessing }
TypShaTypTypChainableResolvers >> ___resolve: _a using: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ TypLookup typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType:
							{((a receiverType parameters at: 2)
								asParametricType: {(a receiverType parameters at: 1)}).
							(a receiverType parameters at: 1)}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | (a argumentTypes at: 2) result ];
		yourself
]

{ #category : #accessing }
TypShaTypTypChainableResolvers >> ___typeFor: _a using: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ TypLookup typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType:
							{((a receiverType parameters at: 2)
								asParametricType: {(a receiverType parameters at: 1)}).
							(a receiverType parameters at: 1)}
						result: TypType typAsType
						optionalParameters: false ] ];
		resultType: [ :a :s :r | TypType typAsType ];
		yourself
]
