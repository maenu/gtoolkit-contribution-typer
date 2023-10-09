Extension { #name : #ArrayedCollection }

{ #category : #'*Typer-Shadow-Pharo' }
ArrayedCollection >> typShaMethodSize: aLookup [
	<typShaMethod: 'size'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
