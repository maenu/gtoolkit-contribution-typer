Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRun: aSymbol [
	^ self typInfRun: aSymbol duration: 5 minutes
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfRun: aSymbol duration: aDuration [
	^ self >> aSymbol typInfRun: aDuration
]
