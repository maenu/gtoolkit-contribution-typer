Extension { #name : #TypPraMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypPraMethodResolver >> typGtExpanderMethod: aLookup [
	^ aLookup receiver classDescription >> aLookup selector
]

{ #category : #'*Typer-GToolkit' }
TypPraMethodResolver >> typGtIndicator [
	^ 'p'
]
