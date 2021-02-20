Class {
	#name : #TypShaBrBrGlamorousIcons,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #accessing }
TypShaBrBrGlamorousIcons class >> ___browse [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Form typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrGlamorousIcons class >> ___inspect [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Form typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaBrBrGlamorousIcons class >> shadowedClass [
	^ BrGlamorousIcons class
]
