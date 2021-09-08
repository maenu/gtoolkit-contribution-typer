Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupIndex class >> instance [

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
TypMethodLookupIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	| lookup |
	lookup := self
		          addDependent: (TypMethodLookup
				           receiver: aType
				           selector: aSymbol
				           arguments: aCollection)
		          path: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new path: #default ].
	^ resolver resolve: lookup
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfInvalidate
]
