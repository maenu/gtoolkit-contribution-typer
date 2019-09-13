Extension { #name : #Boolean }

{ #category : #'*Typer' }
Boolean class >> typAsType [
	"Skip to concrete types"

	^ self == Boolean
		ifTrue: [ super typAsType ]
		ifFalse: [ Boolean typAsType ]
]
