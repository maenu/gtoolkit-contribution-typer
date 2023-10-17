Class {
	#name : #TypTypeIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeIndex >> initialize [
	super initialize.
	resolver := TypBreadthFirstResolver
			resolvers: {TypDepthFirstResolver resolver: TypPraTypeResolver new.
					TypDepthFirstResolver resolver: TypShaTypeResolver new.
					TypDepthFirstResolver resolver: TypInfTypeResolver new}
]

{ #category : #accessing }
TypTypeIndex >> lookupClassDescription: aClassDescription [
	^ self resolve: (TypTypeLookup classDescription: aClassDescription parent: nil)
]

{ #category : #printing }
TypTypeIndex >> printOn: aStream [

	aStream nextPutAll: 'types'
]
