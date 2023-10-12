Extension { #name : #BlLayoutConstraints }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodUnaryHorizontal: aLookup [
	<typShaMethod: 'horizontal'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodUnaryVertical: aLookup [
	<typShaMethod: 'vertical'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]
