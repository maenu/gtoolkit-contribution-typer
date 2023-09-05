Extension { #name : #TypInfReturn }

{ #category : #'*Typer-GToolkit' }
TypInfReturn >> typGtAsShortString [
	^ 'ret'
]

{ #category : #'*Typer-GToolkit' }
TypInfReturn >> typGtColor [
	^ BrGlamorousColors successBackgroundColor paler paler paler darker
]
