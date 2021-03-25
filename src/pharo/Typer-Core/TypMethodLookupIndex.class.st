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
TypMethodLookupIndex >> lookupMethodArgument: anInteger receiver: aType selector: aSymbol arguments: aCollection [
	^ self
		reduce:
			((resolver
				resolve:
					(TypMethodLookup
						receiver: aType
						selector: aSymbol
						arguments: aCollection))
				select: [ :e | e isFunction and: [ e arguments size >= anInteger ] ]
				thenCollect: [ :e | e arguments at: anInteger ])
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

{ #category : #accessing }
TypMethodLookupIndex >> lookupMethodResultReceiver: aType selector: aSymbol arguments: aCollection [
	^ self
		reduce:
			((resolver
				resolve:
					(TypMethodLookup
						receiver: aType
						selector: aSymbol
						arguments: aCollection))
				select: #isFunction
				thenCollect: #result)
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typInfTypeReset
]
