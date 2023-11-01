Extension { #name : #BlKeyCombination }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombination class >> typShaMethodUnaryBuilder: aLookup root: anotherLookup [
	<typShaMethod: 'builder'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombinationBuilder typAsType
]
