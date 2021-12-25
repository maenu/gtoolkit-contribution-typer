Class {
	#name : #TypMethodIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodIndex class >> instance [

	<typPraResult: 'TypMethodLookupIndex'>
	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver:
				              (TypCachingResolver resolver:
						               (TypBreadthFirstResolver resolvers: { 
									                (TypDepthFirstResolver resolver:
											                 (TypBreadthFirstResolver resolvers:
													                  { 
														                  TypPraMethodResolver new.
														                  TypShaMethodResolver new })).
									                (TypDepthFirstResolver resolver:
											                 TypInfMethodResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypMethodIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	| lookup |
	lookup := TypMethodLookup
		          receiver: aType
		          selector: aSymbol
		          arguments: aCollection.
	(resolver canResolve: lookup) ifFalse: [ ^ TypUnknownType instance ].
	^ resolver resolve: lookup
]
