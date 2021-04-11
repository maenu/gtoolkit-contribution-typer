Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription ]
]

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup push: self.
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | 
					(e resolveMethod: aLookup)
						do: [ :f | f addOrigin: aLookup asOrigin ];
						yourself ])
]
