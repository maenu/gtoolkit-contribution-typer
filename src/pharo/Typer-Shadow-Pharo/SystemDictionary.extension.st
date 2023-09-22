Extension { #name : #SystemDictionary }

{ #category : #'*Typer-Shadow-Pharo' }
SystemDictionary class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
		withParameters: {Symbol typAsType.
				{Class typAsType.
					TypUnknownType instance} typAsType}
]
