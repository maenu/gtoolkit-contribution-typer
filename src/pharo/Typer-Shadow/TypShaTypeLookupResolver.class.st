Class {
	#name : #TypShaTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeLookupResolver >> canResolve: aLookup [
	^ aLookup classDescription typShaShadows isNotEmpty
]

{ #category : #accessing }
TypShaTypeLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ self
		reduce:
			(aLookup classDescription typShaShadows
				collect: [ :f | 
					(f resolveType: aLookup)
						addOrigin: (TypLookupOrigin lookup: aLookup);
						addOrigin: (TypShaMethodOrigin method: (f class lookupSelector: #resolveType:));
						yourself ])
]
