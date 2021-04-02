Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	aLookup push: self.
	aLookup receiver isNamed
		ifFalse: [ ^ self unknown ].
	aLookup receiver hasClassDescription
		ifFalse: [ ^ self unknown ].
	^ self
		reduce:
			(aLookup receiver classDescription typShaShadows
				flatCollect: [ :e | 
					(e resolveMethod: aLookup)
						do: [ :f | f addOrigin: aLookup asOrigin ];
						yourself ])
]
