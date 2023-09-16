Extension { #name : #TypLookup }

{ #category : #'*Typer-GToolkit' }
TypLookup >> typGtIndicator [
	^ resolver ifNil: '' ifNotNil: #typGtIndicator
]
