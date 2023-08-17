Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription methods
		anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	^ self
		resolve: aLookup
		reduce: (aLookup receiver classDescription methods
				select: [ :m | m typShaResolvesMethod: aLookup selector ]
				thenCollect: [ :m | 
					| class |
					class := aLookup receiver classDescription newAnonymousSubclass.
					class isClassSide
						ifTrue: [ class instanceSide perform: m selector with: aLookup ]
						ifFalse: [ class
								compile: 'typShaPerform: aSelector with: anObject <primitive: 83> self primitiveFailed'.
							class classSide
								compile: 'typShaNew ^ [ self new ] on: Error do: [ self basicNew ]';
								compile: (Behavior methodDict at: #basicNew) sourceCode;
								compile: (Behavior methodDict at: #basicNew:) sourceCode.
							class typShaNew typShaPerform: m selector with: aLookup ] ])
]
