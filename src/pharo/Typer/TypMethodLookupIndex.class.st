Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core'
}

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