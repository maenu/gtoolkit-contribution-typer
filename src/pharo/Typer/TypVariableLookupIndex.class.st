Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypVariableLookupIndex >> typeFor: aLookup [
	^ (resolver resolve: aLookup)
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ :e | 
			[ :f | f type ]
				on: Error
				do: [ TypUnknownType instance ] ]
]
