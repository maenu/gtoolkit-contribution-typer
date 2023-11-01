Extension { #name : #ByteArray }

{ #category : #'*Typer-Shadow-Pharo' }
ByteArray class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription typAsNamedType
		withParameters: {Integer typAsType}
]
