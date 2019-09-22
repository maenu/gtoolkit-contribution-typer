Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupIndex class >> newDefault [
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
											{TypPraMethodLookupResolver new.
											TypShaMethodLookupResolver new};
										yourself);
								yourself).
							(TypDepthLookupResolver new
								resolver: TypInfMethodLookupResolver new;
								yourself)};
						yourself);
				yourself);
		yourself
]

{ #category : #accessing }
TypMethodLookupIndex >> argumentTypeFor: aLookup at: anInteger [
	(resolver resolve: aLookup)
		do: [ :e | 
			[ | type |
			type := e argumentTypeAt: anInteger.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					f logCr.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType instance
]

{ #category : #accessing }
TypMethodLookupIndex >> resultTypeFor: aLookup [
	(resolver resolve: aLookup)
		do: [ :e | 
			[ | type |
			type := e resultType.
			type isUnknown
				ifFalse: [ ^ type ] ]
				on: Error
				do: [ :f | 
					f logCr.
					self flag: 'FIXME signal?' ] ].
	^ TypUnknownType instance
]

{ #category : #accessing }
TypMethodLookupIndex >> signalsAlwaysFor: aLookup [
	(resolver resolve: aLookup)
		do: [ :e | 
			[ | signalsAlways |
			signalsAlways := e signalsAlways.
			signalsAlways ifNotNil: [ ^ signalsAlways ] ]
				on: Error
				do: [ :f | 
					f logCr.
					self flag: 'FIXME signal?' ] ].
	^ nil
]
