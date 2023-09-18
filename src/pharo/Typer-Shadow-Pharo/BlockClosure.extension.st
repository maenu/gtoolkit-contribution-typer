Extension { #name : #BlockClosure }

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsFunctionTypeWithResult: TypUnknownType instance
]
