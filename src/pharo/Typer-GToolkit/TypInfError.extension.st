Extension { #name : #TypInfError }

{ #category : #'*Typer-GToolkit' }
TypInfError >> typGtAsShortString [
	^ 'err'
]

{ #category : #'*Typer-GToolkit' }
TypInfError >> typGtColor [
	^ BrGlamorousColors errorBorderColor
]
