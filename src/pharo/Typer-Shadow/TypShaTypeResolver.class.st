Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeResolver >> canResolve: aLookup [
	^ aLookup classDescription class methods anySatisfy: #typShaResolvesType
]

{ #category : #printing }
TypShaTypeResolver >> printOn: aStream [

	aStream nextPutAll: 'sha type'
]

{ #category : #accessing }
TypShaTypeResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ self
		resolve: aLookup
		reduce: (aLookup classDescription class methods
				select: #typShaResolvesType
				thenCollect: [ :m | aLookup classDescription perform: m selector with: aLookup ])
]
