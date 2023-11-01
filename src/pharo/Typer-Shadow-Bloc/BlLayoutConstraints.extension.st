Extension { #name : #BlLayoutConstraints }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodUnaryHorizontal: aLookup root: anotherLookup [
	<typShaMethod: 'horizontal'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodUnaryVertical: aLookup root: anotherLookup [
	<typShaMethod: 'vertical'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]
