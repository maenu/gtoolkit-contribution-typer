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
							(TypDepthLookupResolver
								resolver:
									(TypBreadthLookupResolver
										resolvers:
											{TypPraMethodLookupResolver new.
											TypShaMethodLookupResolver new.
											TypInfMethodLookupResolver new})));
				yourself ]
]

{ #category : #accessing }
TypMethodLookupIndex >> lookupMethodReceiver: aType selector: aSymbol arguments: aCollection [
	^ self
		reduce:
			(resolver
				resolve:
					(TypMethodLookup
						receiver: aType
						selector: aSymbol
						arguments: aCollection))
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfTypeReset
]
