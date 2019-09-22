Extension { #name : #Float }

{ #category : #'*Typer-Core' }
Float class >> typAsType [
	"Skip to concrete types"

	^ self == Float
		ifTrue: [ super typAsType ]
		ifFalse: [ Float typAsType ]
]
