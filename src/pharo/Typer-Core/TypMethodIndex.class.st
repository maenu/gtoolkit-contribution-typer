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

{ #category : #initialization }
TypMethodIndex >> invalidate [

	super invalidate.
	TypInfAstNode invalidate
]

{ #category : #accessing }
TypMethodIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	| lookup |
	lookup := self
		          addDependent: (TypMethodLookup
				           receiver: aType
				           selector: aSymbol
				           arguments: aCollection)
		          label: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new label: #default ].
	^ resolver resolve: lookup
]
