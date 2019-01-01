Class {
	#name : #TypShaBrBrTextLabelLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextLabelLook class >> shadowedClass [
	^ BrTextLabelLook class
]

{ #category : #accessing }
TypShaBrBrTextLabelLook >> ___fontSize: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrTextLabelLook >> ___foreground: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			{Color typAsType.
			BlPaint typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
