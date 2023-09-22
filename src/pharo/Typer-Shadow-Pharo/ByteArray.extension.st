Extension { #name : #ByteArray }

{ #category : #'*Typer-Shadow-Pharo' }
ByteArray class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
		withParameters: {Integer typAsType}
]
