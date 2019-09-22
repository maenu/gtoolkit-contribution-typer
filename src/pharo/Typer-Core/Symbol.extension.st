Extension { #name : #Symbol }

{ #category : #'*Typer-Core' }
Symbol class >> typAsType [
	"Skip to concrete types"

	^ self == Symbol
		ifTrue: [ super typAsType ]
		ifFalse: [ Symbol typAsType ]
]
