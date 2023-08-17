Class {
	#name : #TypTypeIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver:
				              (TypBreadthFirstResolver resolvers: { 
							               (TypDepthFirstResolver resolver:
									                (TypBreadthFirstResolver resolvers: { 
												                 TypPraTypeResolver new.
												                 TypShaTypeResolver new })).
							               TypInfTypeResolver new });
			              yourself ]
]

{ #category : #accessing }
TypTypeIndex >> lookupClassDescription: aClassDescription [
	^ self resolve: (TypTypeLookup classDescription: aClassDescription parent: nil)
]

{ #category : #printing }
TypTypeIndex >> printOn: aStream [

	aStream nextPutAll: 'types'
]
