Class {
	#name : #TypTypeLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookupIndex class >> instance [
	^ instance
		ifNil: [ instance := self new
				initializeResolver:
					(TypCachingLookupResolver
						resolver:
							(TypDepthLookupResolver
								resolver:
									(TypBreadthLookupResolver
										resolvers:
											{TypPraTypeLookupResolver new.
											TypShaTypeLookupResolver new.
											TypInfTypeLookupResolver new})));
				yourself ]
]

{ #category : #accessing }
TypTypeLookupIndex >> lookupClassDescription: aClassDescription [
	^ self
		reduce:
			(resolver resolve: (TypTypeLookup classDescription: aClassDescription))
]
