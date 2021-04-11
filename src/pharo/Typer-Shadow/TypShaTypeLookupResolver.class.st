Class {
	#name : #TypShaTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeLookupResolver >> canResolve: aLookup [
	^ true
]

{ #category : #accessing }
TypShaTypeLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	aLookup push: self.
	^ self
		reduce:
			(aLookup root classDescription typShaShadows
				collect: [ :f | 
					(f resolveType: aLookup)
						addOrigin: aLookup asOrigin;
						addOrigin: (TypDescriptionOrigin description: f class name);
						yourself ])
]
