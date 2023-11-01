Extension { #name : #Announcement }

{ #category : #'*Typer-Shadow-Pharo' }
Announcement class >> typShaMethodBinaryConcatenate: aLookup root: anotherLookup [
	<typShaMethod: ','>
	^ CompiledMethod
		typAsFunctionTypeWithResult: AnnouncementSet typAsType
		arguments: {Announcement class typAsType}
]
