Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex >> initialize [
	super initialize.
	resolver := TypBreadthFirstResolver
			resolvers: {TypDepthFirstResolver resolver: TypPraMethodResolver new.
					TypDepthFirstResolver resolver: TypShaMethodResolver new.
					TypDepthFirstResolver resolver: TypInfMethodResolver new}
]

{ #category : #printing }
TypMethodIndex >> printOn: aStream [

	aStream nextPutAll: 'methods'
]
