Class {
	#name : #TypShaPhaKey,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaKey class >> ___h [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Key typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaKey class >> ___t [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Key typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaKey class >> shadowedClass [
	^ Key class
]
