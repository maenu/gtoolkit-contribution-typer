Extension { #name : #Announcement }

{ #category : #'*Typer-Shadow-Pharo' }
Announcement class >> typShaMethodBinary77: aLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Announcement class typAsType}
]
