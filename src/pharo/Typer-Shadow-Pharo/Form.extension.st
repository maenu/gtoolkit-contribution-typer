Extension { #name : #Form }

{ #category : #'*Typer-Shadow-Pharo' }
Form >> typShaMethodUnaryAsElement: aLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]
