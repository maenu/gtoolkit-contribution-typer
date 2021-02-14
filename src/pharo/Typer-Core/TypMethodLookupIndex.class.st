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
										yourself).
									(TypDepthLookupResolver new
										resolver: TypInfMethodLookupResolver new;
										yourself)};
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypMethodLookupIndex >> argumentTypeFor: aLookup at: anInteger [
	<typTypeArgument: 1 as: 'TypLookup'>
	(resolver resolve: aLookup)
		do: [ :e"typCastAs TypMethodLookupResult"
			 | 
			[ | type |
			type := e argumentTypeAt: anInteger.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					f emit.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType new
]

{ #category : #initialization }
TypMethodLookupIndex >> reset [
	super reset.
	ASTCache default do: #typTypeReset
]

{ #category : #accessing }
TypMethodLookupIndex >> resultTypeFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	(resolver resolve: aLookup)
		do: [ :e"typCastAs TypMethodLookupResult"
			 | 
			[ | type |
			type := e resultType.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					f emit.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType new
]

{ #category : #accessing }
TypMethodLookupIndex >> signalsAlwaysFor: aLookup [
	(resolver resolve: aLookup)
		do: [ :e "typCastAs TypMethodLookupResult" | 
			[ | signalsAlways |
			signalsAlways := e signalsAlways.
			signalsAlways ifNotNil: [ ^ signalsAlways ] ]
				on: Error
				do: [ :f | 
					f emit.
					self flag: 'FIXME signal?' ] ].
	^ nil
]
