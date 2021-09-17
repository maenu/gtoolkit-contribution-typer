Class {
	#name : 'TypVariableIndex',
	#superclass : 'TypIndex',
	#category : 'Typer-Core-Lookup'
}

{ #category : 'accessing' }
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

{ #category : 'accessing' }
TypVariableIndex >> lookupReceiver: aType selector: aSymbol [

	| lookup |
	lookup := self
		          addDependent:
		          (TypVariableLookup receiver: aType selector: aSymbol)
		          label: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new label: #default ].
	^ resolver resolve: lookup
]
