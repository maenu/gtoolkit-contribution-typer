Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookupIndex class >> instance [

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
TypVariableLookupIndex >> lookupReceiver: aType selector: aSymbol [

	| lookup |
	lookup := self
		          addDependent:
		          (TypVariableLookup receiver: aType selector: aSymbol)
		          path: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new path: #default ].
	^ resolver resolve: lookup
]
