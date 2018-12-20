Class {
	#name : #TypShaTypTypResolvers,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Typer'
}

{ #category : #'as yet unclassified' }
TypShaTypTypResolvers class >> shadowedClass [
	^ TypResolvers class
]

{ #category : #accessing }
TypShaTypTypResolvers >> ___typeFor: _a using: _b [
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
