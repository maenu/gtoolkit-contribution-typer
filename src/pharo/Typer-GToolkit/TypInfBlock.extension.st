Extension { #name : #TypInfBlock }

{ #category : #'*Typer-GToolkit' }
TypInfBlock >> typGtAsShortString [
	^ 'blo'
]

{ #category : #'*Typer-GToolkit' }
TypInfBlock >> typGtColor [
	^ BrGlamorousColors failureBorderColor / 2
		+ (BrGlamorousColors defaultButtonTextColor / 2)
]
