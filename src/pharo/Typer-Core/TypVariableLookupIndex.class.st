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
										yourself).
									(TypDepthLookupResolver new
										resolver: TypInfVariableLookupResolver new;
										yourself)};
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypVariableLookupIndex >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	(resolver resolve: aLookup)
		do: [ :e"typCastAs TypVariableLookupResult"
			 | 
			[ | type |
			type := e type.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					self log: f for: aLookup.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType instance
]
