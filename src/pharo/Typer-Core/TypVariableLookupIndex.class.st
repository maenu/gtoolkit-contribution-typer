Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookupIndex class >> instance [
	<typTypeResultAs: 'TypVariableLookupIndex'>
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
													{TypPraVariableLookupResolver new.
													TypShaVariableLookupResolver new};
												yourself);
										yourself)".
									(TypDepthLookupResolver new
										resolver: TypInfVariableLookupResolver new;
										yourself)"};
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypVariableLookupIndex >> lookupReceiver: aType selector: aSymbol [
	^ self lookup: (TypVariableLookup receiver: aType selector: aSymbol)
]
