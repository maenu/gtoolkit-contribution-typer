Extension { #name : #Fraction }

{ #category : #'*Typer-Core' }
Fraction class >> typAsType [
	"Skip to concrete types"

	^ self == Fraction
		ifTrue: [ super typAsType ]
		ifFalse: [ Fraction typAsType ]
]
