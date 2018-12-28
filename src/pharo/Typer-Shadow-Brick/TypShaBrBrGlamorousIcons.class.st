Class {
	#name : #TypShaBrBrGlamorousIcons,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #accessing }
TypShaBrBrGlamorousIcons class >> ___browse [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Form typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBrBrGlamorousIcons class >> shadowedClass [
	^ BrGlamorousIcons class
]
