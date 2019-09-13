Extension { #name : #Fraction }

{ #category : #'*Typer' }
Fraction class >> typAsType [
	"Skip to concrete types"

	^ self == Fraction
		ifTrue: [ super typAsType ]
		ifFalse: [ Fraction typAsType ]
]
