Extension { #name : #Symbol }

{ #category : #'*Typer' }
Symbol class >> typAsType [
	"Skip to concrete types"

	^ self == Symbol
		ifTrue: [ super typAsType ]
		ifFalse: [ Symbol typAsType ]
]
