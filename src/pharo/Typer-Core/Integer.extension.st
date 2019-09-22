Extension { #name : #Integer }

{ #category : #'*Typer-Core' }
Integer class >> typAsType [
	"Skip to concrete types"

	^ self == Integer
		ifTrue: [ super typAsType ]
		ifFalse: [ Integer typAsType ]
]
