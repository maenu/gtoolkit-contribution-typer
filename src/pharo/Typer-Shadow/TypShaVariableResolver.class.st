Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription typShaShadows
						anySatisfy: [ :e | e canResolveVariable: aLookup ] ] ]
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
		  reduce:
			  (aLookup receiver classDescription typShaShadows flatCollect: [ 
				   :e | 
				   e class methods
					   select: [ :f | f typShaResolvesVariable: aLookup selector ]
					   thenCollect: [ :f | e perform: f selector with: aLookup ] ])
]
