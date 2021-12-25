Class {
	#name : #TypVariableIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new initializeResolver:
			              (TypBreadthFirstResolver resolvers: { 
					               (TypDepthFirstResolver resolver:
						                (TypBreadthFirstResolver resolvers: { 
								                 TypPraVariableResolver new.
								                 TypShaVariableResolver new })).
					               (TypDepthFirstResolver resolver:
						                TypInfVariableResolver new) }) ]
]

{ #category : #accessing }
TypVariableIndex >> lookupReceiver: aType selector: aSymbol [

	^ self resolve: (TypVariableLookup receiver: aType selector: aSymbol)
]
