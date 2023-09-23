Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aClassDescription at: aSymbol at: anotherSymbol ifAbsent: aBlock [
	| child |
	child := self at: aClassDescription ifAbsent: [ ^ aBlock value ].
	child := child at: aSymbol ifAbsent: [ ^ aBlock value ].
	^ child at: anotherSymbol ifAbsent: [ ^ aBlock value ]
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aClassDescription at: aSymbol at: anotherSymbol ifAbsentPut: aBlock [
	| child |
	child := self at: aClassDescription ifAbsentPut: [ self species new ].
	child := child at: aSymbol ifAbsentPut: [ self species new ].
	^ child at: anotherSymbol ifAbsentPut: aBlock
]
