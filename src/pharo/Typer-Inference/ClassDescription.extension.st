Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfContext: aSymbol [
	^ (self >> aSymbol) typInfContext
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfContext: aSymbol by: aBlock [
	^ self >> aSymbol typInfContextBy: aBlock
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfContext: aSymbol ifPresent: aBlock ifAbsent: anotherBlock [
	^ self >> aSymbol typInfContextIfPresent: aBlock ifAbsent: anotherBlock
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfContextAsync: aSymbol by: aBlock for: aDuration [
	^ self >> aSymbol typInfContextAsyncBy: aBlock for: aDuration
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfContextAsyncWithTally: aSymbol by: aBlock for: aDuration [
	^ self >> aSymbol typInfContextAsyncWithTallyBy: aBlock for: aDuration
]
