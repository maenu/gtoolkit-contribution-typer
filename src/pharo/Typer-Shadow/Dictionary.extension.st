Extension { #name : #Dictionary }

{ #category : #'*Typer-Shadow' }
Dictionary >> typShaAt: aClassDescription at: aSymbol at: anotherSymbol ifAbsent: aBlock [
	^ (self
		at: aClassDescription
		at: aSymbol
		ifAbsent: [ ^ aBlock value ]) at: anotherSymbol ifAbsent: aBlock
]
