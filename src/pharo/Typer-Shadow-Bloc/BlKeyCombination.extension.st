Extension { #name : #BlKeyCombination }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombination class >> typShaMethodBuilder: aLookup [
	<typShaMethod: 'builder'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombinationBuilder typAsType
]
