Class {
	#name : #TypShaBrBrLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrLook class >> shadowedClass [
	^ BrLook class
]

{ #category : #accessing }
TypShaBrBrLook class >> ~~~+ _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{BrLook typAsType.
			BrLook class typAsType} typAsType ];
		resultType: [ :a :s :r | BrLook typAsType ];
		yourself
]
