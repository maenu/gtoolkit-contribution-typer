Class {
	#name : #TypClassLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypClassLookupIndex >> typeFor: aLookup [
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
