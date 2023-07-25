Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription methods
		anySatisfy: [ :e | e typShaResolvesVariable: aLookup selector ]
]

{ #category : #printing }
TypShaVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'sha variable'
]

{ #category : #accessing }
TypShaVariableResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ self
		resolve: aLookup
		reduce: (aLookup receiver classDescription methods
				select: [ :m | m typShaResolvesVariable: aLookup selector ]
				thenCollect: [ :m | 
					self flag: 'TODO new is dirty, use anonymous subclasses?'.
					aLookup receiver classDescription new perform: m selector with: aLookup ])
]
