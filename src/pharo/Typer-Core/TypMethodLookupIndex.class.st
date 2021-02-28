Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupIndex class >> instance [
	<typTypeResultAs: 'TypMethodLookupIndex'>
	^ instance
		ifNil: [ instance := self new
				resolver:
					(TypCachingLookupResolver new
						resolver:
							(TypBreadthLookupResolver new
								resolvers:
									{(TypDepthLookupResolver new
										resolver:
											(TypBreadthLookupResolver new
												resolvers:
													{TypPraMethodLookupResolver new.
													TypShaMethodLookupResolver new};
												yourself);
										yourself)".
									(TypDepthLookupResolver new
										resolver: TypInfMethodLookupResolver new;
										yourself)"};
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypMethodLookupIndex >> lookupReceiver: aType selector: aSymbol arguments: aCollection [
	^ self
		lookup:
			(TypMethodLookup
				receiver: aType
				selector: aSymbol
				arguments: aCollection)
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfTypeReset
]
