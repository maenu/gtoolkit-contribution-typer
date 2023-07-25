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
					| class |
					class := aLookup receiver classDescription newAnonymousSubclass.
					class classSide compile: (Behavior methodDict at: #basicNew) sourceCode.
					class
						compile: 'typShaPerform: aSelector with: anObject <primitive: 83> self primitiveFailed'.
					class basicNew typShaPerform: m selector with: aLookup ])
]
