Class {
	#name : #TypSpreadLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypSpreadLookupResolver >> canResolve: aLookup [
	^ aLookup asCollection allSatisfy: [ :e | resolver canResolve: e ]
]

{ #category : #accessing }
TypSpreadLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ (aLookup asCollection collect: [ :e | resolver resolve: e ])
		typAsType
]
