Class {
	#name : #TypClassLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypClassLookupIndex >> typeFor: aLookup [
	^ (resolver resolve: aLookup)
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ :e | 
			[ e type ]
				on: Error
				do: [ TypUnknownType instance ] ]
]
