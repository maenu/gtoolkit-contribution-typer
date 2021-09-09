Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ aLookup receiver classDescription typShaShadows
						anySatisfy: [ :e | e canResolveMethod: aLookup ] ] ]
]

{ #category : #accessing }
TypShaMethodResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	self addDependent: aLookup label: #resolve:.
	^ self
		  resolve: aLookup
		  reduce:
			  (aLookup receiver classDescription typShaShadows flatCollect: [ 
				   :e | 
				   e class methods
					   select: [ :f | f typShaResolvesMethod: aLookup selector ]
					   thenCollect: [ :f | 
						   self
							   addDependent: (e perform: f selector with: aLookup)
							   label: #shadow
							   data: f ] ])
]
