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

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ self
		  resolve: aLookup
		  reduce:
			  (aLookup receiver classDescription typShaShadows flatCollect: [ 
				   :e | 
				   e class methods
					   select: [ :f | f typShaResolvesMethod: aLookup selector ]
					   thenCollect: [ :f | e perform: f selector with: aLookup ] ])
]
