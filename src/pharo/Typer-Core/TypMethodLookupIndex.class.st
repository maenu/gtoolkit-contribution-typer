Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupIndex class >> instance [
	^ instance
		ifNil: [ instance := self new
				initializeResolver:
					(TypCachingLookupResolver
						resolver:
							(TypSpreadLookupResolver
								resolver:
									(TypDepthLookupResolver
										resolver:
											(TypBreadthLookupResolver
												resolvers:
													{TypPraMethodLookupResolver new.
													TypShaMethodLookupResolver new.
													TypInfMethodLookupResolver new}))));
				yourself ]
]

{ #category : #accessing }
TypMethodLookupIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [
	| lookup |
	lookup := TypMethodLookup
		receiver: aType
		selector: aSymbol
		arguments: aCollection.
	(resolver canResolve: lookup)
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypLookupOrigin lookup: lookup);
				yourself ].
	^ resolver resolve: lookup
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfTypeReset
]
