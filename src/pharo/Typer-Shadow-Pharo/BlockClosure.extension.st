Extension { #name : #BlockClosure }

{ #category : #'*Typer-Shadow-Pharo' }
BlockClosure class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsFunctionTypeWithResult: TypUnknownType instance
]
