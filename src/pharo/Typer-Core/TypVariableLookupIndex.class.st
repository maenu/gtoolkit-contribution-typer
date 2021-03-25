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
	^ self
		reduce:
			(resolver
				resolve: (TypVariableLookup receiver: aType selector: aSymbol))
]
