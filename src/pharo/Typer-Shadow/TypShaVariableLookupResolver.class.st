Class {
	#name : #TypShaVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription ]
]

{ #category : #accessing }
TypShaVariableLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup push: self.
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | 
					(e resolveVariable: aLookup)
						do: [ :f | f addOrigin: aLookup asOrigin ];
						yourself ])
]
