Class {
	#name : #TypShaPhaColor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaColor class >> ___blue [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___green [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___orange [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___purple [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaColor class >> ___red [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Color typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaColor class >> shadowedClass [
	^ Color class
]
