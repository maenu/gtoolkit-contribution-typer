Extension { #name : #TypInfVariable }

{ #category : #'*Typer-GToolkit' }
TypInfVariable >> typGtAsShortString [
	^ 'var'
]

{ #category : #'*Typer-GToolkit' }
TypInfVariable >> typGtColor [
	^ BrGlamorousColors pressedButtonTextColor
]

{ #category : #'*Typer-GToolkit' }
TypInfVariable >> typGtShaCanType [
	^ node variable typGtShaCanTypeIn: self
]

{ #category : #'*Typer-GToolkit' }
TypInfVariable >> typGtShaMethod [
	^ node variable typGtShaMethodIn: self
]
