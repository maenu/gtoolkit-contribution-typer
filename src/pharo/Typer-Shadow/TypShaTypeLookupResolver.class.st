Class {
	#name : #TypShaTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeLookupResolver >> resolve: aLookup [
	aLookup push: self.
	^ aLookup root classDescription typShaShadows
		collect: [ :f | 
			(f resolveType: aLookup)
				addOrigin: aLookup asOrigin;
				yourself ]
]
