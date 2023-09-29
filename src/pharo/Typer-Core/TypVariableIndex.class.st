Class {
	#name : #TypVariableIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableIndex >> initialize [
	super initialize.
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypPraVariableResolver new.
							TypShaVariableResolver new.
							TypInfVariableResolver new})
]

{ #category : #printing }
TypVariableIndex >> printOn: aStream [

	aStream nextPutAll: 'variables'
]
