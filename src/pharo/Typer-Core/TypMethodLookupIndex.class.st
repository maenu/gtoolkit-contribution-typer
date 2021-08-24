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
				              (TypCachingLookupResolver resolver:
						               (TypBreadthFirstLookupResolver resolvers: { 
									                (TypDepthFirstLookupResolver resolver:
											                 (TypBreadthFirstLookupResolver resolvers:
													                  { 
														                  TypPraMethodLookupResolver new.
														                  TypShaMethodLookupResolver new })).
									                (TypDepthFirstLookupResolver resolver:
											                 TypInfMethodLookupResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypMethodLookupIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [

	| lookup |
	lookup := TypMethodLookup
		          receiver: aType
		          selector: aSymbol
		          arguments: aCollection.
	(resolver canResolve: lookup) ifFalse: [ 
		^ TypUnknownType new copyWithOrigins:
			  { (TypLookupOrigin lookup: lookup) } ].
	^ resolver resolve: lookup
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfTypeReset
]
