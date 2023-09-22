Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex class >> instance [
	^ instance
		ifNil: [ instance := self new
					initializeResolver: (TypDepthFirstResolver
							resolver: (TypBreadthFirstResolver
									resolvers: {TypPraMethodResolver new.
											TypShaMethodResolver new.
											TypInfMethodResolver instance}));
					yourself ]
]

{ #category : #printing }
TypMethodIndex >> printOn: aStream [

	aStream nextPutAll: 'methods'
]
