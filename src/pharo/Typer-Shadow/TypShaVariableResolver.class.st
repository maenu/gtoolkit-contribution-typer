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

{ #category : #accessing }
TypShaVariableResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	self addDependent: aLookup label: #resolve:.
	^ self
		  resolve: aLookup
		  reduce:
			  (aLookup receiver classDescription typShaShadows flatCollect: [ 
				   :e | 
				   e class methods
					   select: [ :f | f typShaResolvesVariable: aLookup selector ]
					   thenCollect: [ :f | 
						   self
							   addDependent: (e perform: f selector with: aLookup)
							   label: #shadow
							   data: f ] ])
]
