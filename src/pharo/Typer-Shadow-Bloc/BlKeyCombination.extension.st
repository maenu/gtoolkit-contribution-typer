Extension { #name : #BlKeyCombination }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombination class >> typShaMethodUnaryBuilder: aLookup [
	<typShaMethod: 'builder'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombinationBuilder typAsType
]
