Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex >> initialize [
	super initialize.
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypPraMethodResolver new.
							TypShaMethodResolver new.
							TypInfMethodResolver new})
]

{ #category : #printing }
TypMethodIndex >> printOn: aStream [

	aStream nextPutAll: 'methods'
]
