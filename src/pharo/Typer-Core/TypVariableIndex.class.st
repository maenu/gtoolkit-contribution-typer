Class {
	#name : #TypVariableIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver:
				              (TypCachingResolver resolver:
						               (TypBreadthFirstResolver resolvers: { 
									                (TypDepthFirstResolver resolver:
											                 (TypBreadthFirstResolver resolvers:
													                  { 
														                  TypPraVariableResolver new.
														                  TypShaVariableResolver new })).
									                (TypDepthFirstResolver resolver:
											                 TypInfVariableResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypVariableIndex >> lookupReceiver: aType selector: aSymbol [

	| lookup |
	lookup := TypVariableLookup receiver: aType selector: aSymbol.
	(resolver canResolve: lookup) ifFalse: [ ^ unknown ].
	^ resolver resolve: lookup
]
