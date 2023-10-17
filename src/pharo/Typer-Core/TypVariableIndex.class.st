Class {
	#name : #TypVariableIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableIndex >> initialize [
	super initialize.
	resolver := TypBreadthFirstResolver
			resolvers: {TypDepthFirstResolver resolver: TypPraVariableResolver new.
					TypDepthFirstResolver resolver: TypShaVariableResolver new.
					TypDepthFirstResolver resolver: TypInfVariableResolver new}
]

{ #category : #printing }
TypVariableIndex >> printOn: aStream [

	aStream nextPutAll: 'variables'
]
