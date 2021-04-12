Class {
	#name : #TypSpreadLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypSpreadLookupResolver >> resolve: aLookup [
	^ (aLookup asCollection collect: [ :e | resolver resolve: e ])
		typAsType
]
