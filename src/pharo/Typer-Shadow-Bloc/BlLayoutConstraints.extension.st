Extension { #name : #BlLayoutConstraints }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodHorizontal: aLookup [
	<typShaMethod: 'horizontal'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutConstraints >> typShaMethodVertical: aLookup [
	<typShaMethod: 'vertical'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlLayoutConstraintsAxis typAsType
]
