Class {
	#name : #TypTypeIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new initializeResolver:
			              (TypBreadthFirstResolver resolvers: { 
					               (TypDepthFirstResolver resolver:
						                (TypBreadthFirstResolver resolvers: { 
								                 TypPraTypeResolver new.
								                 TypShaTypeResolver new })).
					               (TypDepthFirstResolver resolver:
						                TypInfTypeResolver new) }) ]
]

{ #category : #accessing }
TypTypeIndex >> lookupClassDescription: aClassDescription [

	^ self resolve: (TypTypeLookup classDescription: aClassDescription)
]
