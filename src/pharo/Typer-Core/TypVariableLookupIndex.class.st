Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookupIndex class >> instance [
	^ instance
		ifNil: [ instance := self new
				initializeResolver:
					(TypCachingLookupResolver
						resolver:
							(TypDepthLookupResolver
								resolver:
									(TypBreadthLookupResolver
										resolvers:
											{TypPraVariableLookupResolver new.
											TypShaVariableLookupResolver new.
											TypInfVariableLookupResolver new})));
				yourself ]
]

{ #category : #accessing }
TypVariableLookupIndex >> lookupReceiver: aType selector: aSymbol [
	| lookup |
	lookup := TypVariableLookup receiver: aType selector: aSymbol.
	(resolver canResolve: lookup)
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypLookupOrigin lookup: lookup);
				yourself ].
	^ resolver resolve: lookup
]
