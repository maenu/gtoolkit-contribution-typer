Class {
	#name : #TypShaBrBrLabel,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrLabel class >> shadowedClass [
	^ BrLabel class
]

{ #category : #accessing }
TypShaBrBrLabel >> ___text: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			BlText typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
