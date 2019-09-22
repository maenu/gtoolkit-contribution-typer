Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Typer-Core'
}

{ #category : #accessing }
TypVariableLookupIndex class >> newDefault [
	^ self new
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
		yourself
]

{ #category : #accessing }
TypVariableLookupIndex >> typeFor: aLookup [
	(resolver resolve: aLookup)
		do: [ :e | 
			[ | type |
			type := e type.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					f logCr.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType instance
]
