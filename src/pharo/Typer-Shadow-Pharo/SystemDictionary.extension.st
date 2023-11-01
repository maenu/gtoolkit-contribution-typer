Extension { #name : #SystemDictionary }

{ #category : #'*Typer-Shadow-Pharo' }
SystemDictionary class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription typAsNamedType
		withParameters: {Symbol typAsType.
				{Class typAsType.
					TypUnknownType instance} typAsType}
]
