Extension { #name : #Form }

{ #category : #'*Typer-Shadow-Pharo' }
Form >> typShaMethodUnaryAsElement: aLookup root: anotherLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]
