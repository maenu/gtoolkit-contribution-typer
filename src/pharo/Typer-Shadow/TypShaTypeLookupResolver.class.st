Class {
	#name : #TypShaTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaTypeLookupResolver >> resolveBasic: aLookup [
	^ aLookup root classDescription typShaShadows
		collect: [ :f | 
			(f resolveType: aLookup)
				origin: aLookup asOrigin;
				yourself ]
]
