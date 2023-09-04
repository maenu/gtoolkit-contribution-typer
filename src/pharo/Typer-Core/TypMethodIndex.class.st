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

{ #category : #accessing }
TypMethodIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	^ self resolve: (TypMethodLookup
			   receiver: aType
			   selector: aSymbol
			   arguments: aCollection
			   parent: nil)
]

{ #category : #printing }
TypMethodIndex >> printOn: aStream [

	aStream nextPutAll: 'methods'
]
