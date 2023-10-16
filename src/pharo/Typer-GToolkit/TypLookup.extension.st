Extension { #name : #TypLookup }

{ #category : #'*Typer-GToolkit' }
TypLookup >> typGtIndicator [
	"i for inlined, has no resolver"

	^ resolver ifNil: 'i' ifNotNil: #typGtIndicator
]
