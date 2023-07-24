Extension { #name : #Form }

{ #category : #'*Typer-Shadow-Pharo' }
Form >> typShaMethodAsElement: aLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]
