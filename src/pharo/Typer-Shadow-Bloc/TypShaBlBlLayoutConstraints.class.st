Class {
	#name : #TypShaBlBlLayoutConstraints,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlLayoutConstraints class >> shadowedClass [
	^ BlLayoutConstraints class
]

{ #category : #accessing }
TypShaBlBlLayoutConstraints >> ___horizontal [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlLayoutConstraintsAxis typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlLayoutConstraints >> ___vertical [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlLayoutConstraintsAxis typAsType ];
		yourself
]
