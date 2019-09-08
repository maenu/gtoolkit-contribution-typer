Class {
	#name : #TypMethodLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodLookupIndex >> argumentTypeFor: aLookup at: anInteger [
	^ (resolver resolve: aLookup)
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ :e | 
			[ e argumentTypeAt: anInteger ]
				on: Error
				do: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypMethodLookupIndex >> resultTypeFor: aLookup [
	^ (resolver resolve: aLookup)
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ :e | 
			[ e resultType ]
				on: Error
				do: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypMethodLookupIndex >> signalsAlwaysFor: aLookup [
	^ (resolver resolve: aLookup)
		ifNotNil: [ :e | 
			[ e signalsAlways ]
				on: Error
				do: [ nil ] ]
]
